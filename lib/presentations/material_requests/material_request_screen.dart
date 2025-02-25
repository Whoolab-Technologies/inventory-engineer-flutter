import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/injection/injection.dart';
import 'package:mvp_engineer/presentations/widgets/app_shimmer.dart';

class MaterialRequestScreen extends StatelessWidget {
  const MaterialRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Material Requests',
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
      )),
      body: BlocProvider(
        create: (context) => getIt<MaterialRequestBloc>()
          ..add(const MaterialRequestEvent.fetchMaterialRequests()),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: const MaterialRequestList(),
        ),
      ),
    );
  }
}

class MaterialRequestList extends StatefulWidget {
  const MaterialRequestList({super.key});

  @override
  State<MaterialRequestList> createState() => _MaterialRequestListState();
}

class _MaterialRequestListState extends State<MaterialRequestList> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
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
                      ? Center(
                          child: Text(
                          "No material requests found.",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 16.sp,
                          ),
                        ))
                      : ListView.builder(
                          itemCount: requests.length,
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
        title: Text(request.title),
        subtitle: Text(request.description),
        trailing: Text(
          "${request.items.length} items",
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
              "Title: ${request.title}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Description: ${request.description}"),
            const Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: request.items.length,
              itemBuilder: (context, index) {
                final item = request.items[index];
                return ListTile(
                  leading: const Icon(Icons.inventory),
                  title: Text(item.productName),
                  trailing: Text("Qty: ${item.quantity}"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
