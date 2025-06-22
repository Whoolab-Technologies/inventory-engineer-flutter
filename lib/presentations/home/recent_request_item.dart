import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_shared_components/core/extensions.dart';
import 'package:mvp_shared_components/widgets/app_status_container.dart';

class RecentRequestItem extends StatelessWidget {
  const RecentRequestItem({super.key, required this.materialRequest});
  final MaterialRequest materialRequest;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Section: Request Number
          Text(
            materialRequest.requestNumber ?? "Request #",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              fontSize: 16.sp,
            ),
          ),

          SizedBox(height: 8.h),

          /// Date and Time
          Row(
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 16.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Text(
                materialRequest.createdDate,
                style: TextStyle(fontSize: 13.sp, color: Colors.black54),
              ),
              SizedBox(width: 12.w),
              Icon(Icons.access_time, size: 16.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              Text(
                materialRequest.createdTime,
                style: TextStyle(fontSize: 13.sp, color: Colors.black54),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          /// Status (Full Text Visible)
          AppStatusContainer(
            status: materialRequest.status!,
          ),

          SizedBox(height: 10.h),

          /// Item Count
          Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: theme.colorScheme.secondary,
              ),
              SizedBox(width: 8.w),
              Text(
                "${(materialRequest.items ?? []).length} item(s)",
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
