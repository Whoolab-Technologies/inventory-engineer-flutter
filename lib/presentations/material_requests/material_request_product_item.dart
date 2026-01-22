import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_shared_components/core/models/status/status.dart';

class MaterialRequestProductItem extends StatelessWidget {
  const MaterialRequestProductItem({
    super.key,
    required this.item,
    required this.status,
  });

  final MaterialRequestItem? item;
  final Status? status;

  @override
  Widget build(BuildContext context) {
    final requestedQty = item?.quantity ?? 0;
    final issuedQty = item?.issuedQuantity ?? 0;
    final isPartialIssue = issuedQty < requestedQty;
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              width: 50.w,
              height: 50.w,
              color: Colors.grey[200],
              child:
                  item!.productImage != null && item!.productImage!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: item!.productImage!, fit: BoxFit.cover)
                      : Icon(Icons.image, color: Colors.grey, size: 24.sp),
            ),
          ),
          SizedBox(width: 12.w),

          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item!.productName ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _tag("Material Id", item!.catId),
                    _tag("Cat", item!.categoryName),
                    _tag("Brand", item!.brandName),
                    _tag("Unit", item!.unit),
                  ],
                ),
                SizedBox(height: 6.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Quantity: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade700,
                          ),
                        ),
                        TextSpan(
                          text: "${item!.quantity} ${item!.unit ?? ''}",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.blueGrey.shade900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (status?.id == 9 && isPartialIssue)
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Text(
                      "Partial quantity issued ($issuedQty), awaiting procurement for remaining ${requestedQty - issuedQty}.",
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade800,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _tag(String label, String? value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "$label: ",
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: value ?? '-',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.normal,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
