import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/presentations/material_requests/material_request_details_widget.dart';
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
              context.read<ProductsBloc>().add(ProductsEvent.getAllProducts());
              context
                  .read<MaterialRequestBloc>()
                  .add(const MaterialRequestEvent.start());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const MaterialRequestCreateScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context
              .read<MaterialRequestBloc>()
              .add(const MaterialRequestEvent.fetchMaterialRequests());
        },
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
        if (state.isLoading) {
          return _buildShimmerLoading();
        }

        return state.materialRequestsFailureOrSuccess.fold(
          () => const SizedBox.shrink(),
          (either) => either.fold(
            (failure) {
              final message = failure.maybeWhen(
                orElse: () => "Something went wrong.",
                customError: (msg) => msg,
              );

              return SizedBox.expand(
                child: Center(
                  child: Text(
                    "Error: $message",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            },
            (requests) {
              if (requests.isEmpty) {
                return const Center(
                  child: AppEmptyListContainer(
                    message: Strings.noMRsAvailable,
                  ),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.all(8.w),
                itemCount: requests.length,
                separatorBuilder: (_, __) => SizedBox(height: 8.h),
                itemBuilder: (_, index) {
                  final request = requests[index];
                  return MaterialRequestTile(request: request);
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: EdgeInsets.all(8.w),
      itemCount: 6,
      itemBuilder: (_, __) => Card(
        child: ListTile(
          title: Container(
            margin: EdgeInsets.symmetric(vertical: 8.h),
            child: AppShimmer(width: double.infinity, height: 24.w),
          ),
          subtitle: AppShimmer(height: 20.w, width: double.infinity),
          trailing: AppShimmer(width: 24.w, height: 24.w),
        ),
      ),
    );
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Request number and status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    request.requestNumber ?? "",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: AppStatusContainer(status: request.status!),
                ),
              ],
            ),
            SizedBox(height: 4.h),

            /// Date and item count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.createdDateTime,
                  style: TextStyle(fontSize: 12.sp, color: Colors.black87),
                ),
                Text(
                  "${(request.items ?? []).length} items",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: Colors.black54,
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
    List<MaterialRequestItem> items = [...(request.items ?? [])];
    showModalBottomSheet(
      context: context,
      builder: (_) =>
          MaterialRequestDetailsWidget(items: items, request: request),
    );
  }
}
