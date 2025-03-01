import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/presentations/widgets/app_shimmer.dart';

class ProductCardShimmer extends StatelessWidget {
  const ProductCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(2, 1.5),
            ),
          ],
        ),
        child: SizedBox(
          width: 120.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppShimmer(
                child: Container(
                  height: 100.h,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: AppShimmer(
                  child: Container(
                    width: double.infinity,
                    height: 14.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
