import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';

class TransferItemShimmer extends StatelessWidget {
  const TransferItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(1, 2),
          )
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppShimmer(height: 16.h, width: 120.w),
                AppShimmer(height: 18.h, width: 120.w),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppShimmer(height: 16.w, width: 16.w),
                SizedBox(
                  width: 4.w,
                ),
                AppShimmer(height: 16.w, width: 130.w),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppShimmer(height: 14.w, width: 16.w),
                SizedBox(
                  width: 4.w,
                ),
                AppShimmer(height: 14.w, width: 130.w),
              ],
            )
          ]),
    );
  }
}
