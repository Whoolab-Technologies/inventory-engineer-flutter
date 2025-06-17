import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:mvp_engineer/presentations/widgets.dart';
import 'package:mvp_shared_components/core/extensions.dart';
import 'package:mvp_shared_components/widgets/app_status_container.dart';

class TransferItem extends StatelessWidget {
  const TransferItem({
    super.key,
    required this.item,
  });

  final Transfer item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.w),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return buildTranactionDetailsWidget(context, item);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.w),
        margin: EdgeInsets.all(2.w),
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
                Text(
                  item.materialRequest!.requestNumber ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                AppStatusContainer(
                  status: item.status ?? "",
                  child: Text(
                    (item.status ?? "").toUpperCaseWithSpace(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                const Icon(
                  Icons.receipt_long_outlined,
                  color: const Color.fromARGB(255, 95, 95, 95),
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text(
                  "${item.dnNumber}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            ...(item.notes ?? []).map(
              (el) => Column(
                children: [
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.note_alt_outlined,
                        size: 14.sp,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Expanded(
                        child: Text(
                          el.note ?? "",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
