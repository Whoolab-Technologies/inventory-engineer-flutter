import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/presentations/home/loading-skeletons/home_card_shimmer.dart';
import 'package:mvp_engineer/presentations/home/loading-skeletons/product_card_shimmer.dart';
import 'package:mvp_engineer/presentations/home/loading-skeletons/title_shimmer.dart';
import 'package:mvp_engineer/presentations/home/loading-skeletons/user_card_shimmer.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const UserCardShimmer(),
      SizedBox(height: 16.0.h),
      const TitleShimmer(),
      SizedBox(height: 8.0.h),
      const TitleShimmer(),
      SizedBox(height: 8.0.h),
      SizedBox(
        height: 160.0.h,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 8.w,
            );
          },
          itemBuilder: (context, index) {
            return const ProductCardShimmer();
          },
        ),
      ),
      GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0.w,
        mainAxisSpacing: 16.0.h,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeCardShimmer(),
          HomeCardShimmer(),
          HomeCardShimmer(),
          HomeCardShimmer(),
        ],
      ),
      SizedBox(height: 16.0.h),
    ]);
  }
}
