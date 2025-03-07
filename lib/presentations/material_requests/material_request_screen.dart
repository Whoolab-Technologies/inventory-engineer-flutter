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
              context
                  .read<ProductsBloc>()
                  .add(const ProductsEvent.getProducts());

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MaterialRequestCreateScreen();
                  },
                ),
              ).then((value) {
                if (value != null) {
                  context
                      .read<MaterialRequestBloc>()
                      .add(const MaterialRequestEvent.fetchMaterialRequests());
                }
              });
            },
            icon: const Icon(
              Icons.add_circle_outline,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: const MaterialRequestList(),
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
                (either) => either.fold(
                  (failure) {
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
                  },
                  (requests) => requests.isEmpty
                      ? const AppEmptyListContainer(
                          message: Strings.noMRsAvailable)
                      : ListView.separated(
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
                ),
              );
      },
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
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
        title: Text(
          request.requestNumber ?? "",
          style: TextStyle(
            fontSize: 16.sp,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(request.description ?? ""),
            Text(request.createdDateTime),
          ],
        ),
        trailing: Text(
          "${(request.items ?? []).length} items",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () => _showMaterialRequestDetails(context, request),
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
