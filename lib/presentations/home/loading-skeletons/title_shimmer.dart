import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/presentations/widgets/app_shimmer.dart';

class TitleShimmer extends StatelessWidget {
  const TitleShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: AppShimmer(
          child: Container(
            height: 20.h,
            width: 100.w,
            color: Colors.grey,
          ),
        ));
  }
}
