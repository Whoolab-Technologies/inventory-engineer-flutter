import 'package:flutter/material.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCardShimmer extends StatelessWidget {
  const UserCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.w),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppShimmer(width: 100.w, height: 14.h),
                SizedBox(height: 4.h),
                AppShimmer(width: 150.w, height: 20.h),
              ],
            ),
            AppShimmer(width: 70.w, height: 70.w, shape: BoxShape.circle),
          ],
        ),
      ),
    );
  }
}
