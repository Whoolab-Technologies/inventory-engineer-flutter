import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/presentations/material_requests/material_requests_create_screen.dart';
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
          //   Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   child: Shimmer.fromColors(
          //     baseColor: Colors.grey[300]!,
          //     highlightColor: Colors.grey[100]!,
          //     child: Container(
          //       height: 70,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //     ),
          //   ),
          // ),
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
                      (request.status ?? "").toUpperCase(),
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
            Text(
              "${request.requestNumber}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(request.description ?? ""),
            const Divider(),
            ListView.separated(
              shrinkWrap: true,
              itemCount: (request.items ?? []).length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                final prdt = request.items![index];
                return ListTile(
                  leading: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: prdt.productImage != null &&
                              prdt.productImage!.isNotEmpty
                          ? Image.network(
                              prdt.productImage!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.image,
                                    size: 24.sp, color: Colors.grey);
                              },
                            )
                          : Icon(Icons.image, size: 24.sp, color: Colors.grey),
                    ),
                  ),
                  title: Text(
                    prdt.productName ?? "",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  trailing: Text(
                    "Qty: ${prdt.quantity} (${prdt.unit ?? ""})",
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
