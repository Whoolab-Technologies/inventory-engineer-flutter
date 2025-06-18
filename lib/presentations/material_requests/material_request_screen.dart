import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/presentations/material_requests/material_requests_create_screen.dart';
import 'package:mvp_shared_components/core/extensions.dart';
import 'package:mvp_shared_components/widgets/app_empty_list_container.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';
import 'package:mvp_shared_components/widgets/app_status_container.dart';

class MaterialRequestScreen extends StatefulWidget {
  const MaterialRequestScreen({super.key});

  @override
  State<MaterialRequestScreen> createState() => _MaterialRequestScreenState();
}

class _MaterialRequestScreenState extends State<MaterialRequestScreen> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.materialRequests,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ProductsBloc>().add(
                    ProductsEvent.getProducts(all: true),
                  );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MaterialRequestCreateScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle_outline,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<MaterialRequestBloc>().add(
                const MaterialRequestEvent.fetchMaterialRequests(),
              );
        },
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  padding: EdgeInsets.all(8.w),
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: const MaterialRequestList()),
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialRequestList extends StatelessWidget {
  const MaterialRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialRequestBloc, MaterialRequestState>(
      builder: (context, state) {
        return state.isLoading
            ? _buildShimmerLoading()
            : state.materialRequestsFailureOrSuccess.fold(
                () => const SizedBox.shrink(),
                (either) => either.fold((failure) {
                  String message = failure.maybeWhen(
                      orElse: () => "", customError: (message) => message);
                  return Center(
                    child: Text(
                      "Error: $message",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 16.sp,
                      ),
                    ),
                  );
                }, (requests) {
                  return Column(
                    children: [
                      requests.isEmpty
                          ? const AppEmptyListContainer(
                              message: Strings.noMRsAvailable)
                          : ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: requests.length,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 8.h,
                                );
                              },
                              itemBuilder: (context, index) {
                                final request = requests[index];
                                return MaterialRequestTile(
                                  request: request,
                                );
                              },
                            ),
                    ],
                  );
                }),
              );
      },
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (_, __) {
          return Card(
            clipBehavior: Clip.hardEdge,
            child: ListTile(
              title: AppShimmer(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8.h),
                  color: Colors.grey[300],
                  width: 150.w,
                  height: 24.w,
                ),
              ),
              subtitle: AppShimmer(
                child: Container(
                  color: Colors.grey[300],
                  width: 150.w,
                  height: 24.w,
                ),
              ),
              trailing: AppShimmer(
                child: Container(
                  color: Colors.grey[300],
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ),
          );
        });
  }
}

class MaterialRequestTile extends StatelessWidget {
  const MaterialRequestTile({super.key, required this.request});
  final MaterialRequest request;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () => _showMaterialRequestDetails(context, request),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.requestNumber ?? "",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                AppStatusContainer(
                    status: (request.status ?? ""),
                    child: Text(
                      (request.status ?? "").toUpperCaseWithSpace(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.createdDateTime,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  "${(request.items ?? []).length} items",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMaterialRequestDetails(
      BuildContext context, MaterialRequest request) {
    final items = [...(request.items ?? [])];
    showModalBottomSheet(
      context: context,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Material Request Details",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${request.requestNumber}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.primary),
                ),
                AppStatusContainer(
                    status: (request.status ?? ""),
                    child: Text(
                      ("${items.length} Items").toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    )),
              ],
            ),
            Text(request.description ?? ""),
            const Divider(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: (items).length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  final prdt = items[index];
                  return MaterialRequestProductItem(item: prdt);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialRequestProductItem extends StatelessWidget {
  const MaterialRequestProductItem({
    super.key,
    required this.item,
  });

  final MaterialRequestItem? item;

  @override
  Widget build(BuildContext context) {
    final requestedQty = item?.quantity ?? 0;
    final issuedQty = item?.issuedQuantity ?? 0;
    final isPartialIssue = issuedQty < requestedQty;
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              width: 50.w,
              height: 50.w,
              color: Colors.grey[200],
              child:
                  item!.productImage != null && item!.productImage!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: item!.productImage!, fit: BoxFit.cover)
                      : Icon(Icons.image, color: Colors.grey, size: 24.sp),
            ),
          ),
          SizedBox(width: 12.w),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item!.productName ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _tag("Cat.Id", item!.catId),
                    _tag("Cat", item!.categoryName),
                    _tag("Brand", item!.brandName),
                    _tag("Unit", item!.unit),
                  ],
                ),
                SizedBox(height: 6.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Quantity: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        TextSpan(
                          text: "${item!.quantity} ${item!.unit ?? ''}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (isPartialIssue)
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Text(
                      "Partial quantity issued ($issuedQty), awaiting procurement for remaining ${requestedQty - issuedQty}.",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade800,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String label, String? value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "$label: ",
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: value ?? '-',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.normal,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
