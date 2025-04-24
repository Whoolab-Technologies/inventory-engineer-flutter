import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_shared_components/widgets/app_status_container.dart';

class RecentRequestItem extends StatelessWidget {
  const RecentRequestItem({super.key, required this.materialRequest});
  final MaterialRequest materialRequest;
  @override
  Widget build(BuildContext context) {
    log("${materialRequest.stockTransfer?.status}");
    return AspectRatio(
      aspectRatio: 1.75,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                materialRequest.requestNumber ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    materialRequest.createdDate,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    materialRequest.createdTime,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppStatusContainer(
                    status: _getStatustext(materialRequest),
                    child: Text(
                      _getStatustext(materialRequest).toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "${(materialRequest.items ?? []).length}",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _getStatustext(MaterialRequest materialRequest) {
    if (materialRequest.stockTransfer != null) {
      return materialRequest.stockTransfer?.status ?? "";
    } else {
      return materialRequest.status ?? "";
    }
  }
}
