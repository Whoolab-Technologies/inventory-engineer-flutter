import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';

class ProductItemWidget extends StatelessWidget {
  final String productName;
  final String description;
  final String imageUrl;
  final bool isStockIn;
  final int? stockCount;
  final int stockWithOthers;
  final VoidCallback? onTap;
  final String? brandName;
  final String? catId;
  final String? categoryName;
  final String? categoryId;
  const ProductItemWidget({
    super.key,
    required this.productName,
    required this.description,
    required this.imageUrl,
    required this.isStockIn,
    this.stockCount,
    this.onTap,
    required this.stockWithOthers,
    this.brandName,
    this.catId,
    this.categoryName,
    this.categoryId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      splashColor: Colors.grey.withOpacity(0.3),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Placeholder
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.grey[300],
                ),
                child: imageUrl.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image,
                                size: 40.sp, color: Colors.grey);
                          },
                        ))
                    : Icon(Icons.image, size: 40.sp, color: Colors.grey),
              ),
              SizedBox(width: 10.w),
              // Product Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(height: 5.h),
                    RichText(
                      text: TextSpan(
                        style:
                            TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                        children: [
                          TextSpan(
                            text: catId ?? '-',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const TextSpan(
                              text: ' | ',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                            text: categoryId ?? '-',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const TextSpan(
                              text: ' | ',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                            text: categoryName ?? '-',
                            style: const TextStyle(color: Colors.black),
                          ),
                          const TextSpan(
                              text: ' | ',
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                            text: brandName ?? '-',
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              isStockIn ? Icons.check_circle : Icons.cancel,
                              color: isStockIn ? Colors.green : Colors.red,
                              size: 18.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              isStockIn ? 'Stock In: $stockCount' : 'Stock Out',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: isStockIn ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "With Others: ",
                            ),
                            Text(
                              "$stockWithOthers",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: stockWithOthers > 0
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItemShimmer extends StatelessWidget {
  const ProductItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppShimmer(width: 60.w, height: 60.h),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppShimmer(width: double.infinity, height: 16.h),
                  SizedBox(height: 5.h),
                  AppShimmer(width: double.infinity, height: 14.h),
                  SizedBox(height: 5.h),
                  AppShimmer(width: double.infinity, height: 14.h),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      AppShimmer(width: 18.w, height: 18.h),
                      SizedBox(width: 5.w),
                      AppShimmer(width: 80.w, height: 14.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
