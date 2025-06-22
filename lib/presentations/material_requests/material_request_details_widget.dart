import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/presentations/material_requests/material_request_product_item.dart';
import 'package:mvp_shared_components/widgets/app_status_container.dart';

class MaterialRequestDetailsWidget extends StatelessWidget {
  const MaterialRequestDetailsWidget(
      {super.key, required this.items, required this.request});
  final MaterialRequest request;
  final List<MaterialRequestItem> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  status: request.status!,
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
                return MaterialRequestProductItem(
                    item: prdt, status: request.status);
              },
            ),
          ),
        ],
      ),
    );
  }
}
