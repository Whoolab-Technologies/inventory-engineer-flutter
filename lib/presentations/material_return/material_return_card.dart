import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/models/material_return/material_return.dart';

class MaterialReturnCard extends StatelessWidget {
  final MaterialReturn materialReturn;

  const MaterialReturnCard({super.key, required this.materialReturn});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'DN: ${materialReturn.dnNumber ?? '-'}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: color,
              ),
            ),
            SizedBox(height: 4.h),
            // Text(
            //   'From: ${materialReturn.fromStore?.name ?? "-"}',
            //   style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
            // ),
            // Text(
            //   'To: ${materialReturn.toStore?.name ?? "-"}',
            //   style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
            // ),
            buildStatusSection(materialReturn.status ?? ""),

            // if ((materialReturn.details?.isNotEmpty ?? false)) ...[
            //   SizedBox(height: 4.h),
            //   Text(
            //     'Engineer: ${materialReturn.details!.first.engineer?.name ?? "-"}',
            //     style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
            //   ),
            // ],
            SizedBox(height: 12.h),

            // Items
            ...(materialReturn.items ?? []).map((item) {
              final product = item.product;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product?.item ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      [
                        product?.catId,
                        product?.categoryName,
                        product?.productCategory,
                        product?.brandName,
                      ].whereType<String>().join(' | '),
                      style: TextStyle(fontSize: 11.sp, color: Colors.black54),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Issued: ${item.issued}  |  Received: ${item.received ?? 0}',
                      style:
                          TextStyle(fontSize: 11.sp, color: Colors.grey[700]),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildStatusSection(String status) {
    Color statusColor;

    switch (status.toUpperCase()) {
      case 'RECEIVED':
        statusColor = Colors.green;
        break;
      case 'IN TRANSIT':
        statusColor = Colors.orange;
        break;
      case 'PARTIALLY RECEIVED':
        statusColor = const Color.fromARGB(255, 216, 253, 235);
        break;
      default:
        statusColor = Colors.grey;
    }
    return Row(
      children: [
        Text(
          "Status: $status",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: statusColor,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
