import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:mvp_engineer/presentations/transfer/transfer_item.dart';
import 'package:mvp_shared_components/widgets/app_empty_list_container.dart';

class TransferListViewer extends StatelessWidget {
  const TransferListViewer({
    super.key,
    required this.transfers,
  });
  final List<Transfer> transfers;

  @override
  Widget build(BuildContext context) {
    log("${transfers.length}");
    return transfers.isEmpty
        ? const AppEmptyListContainer(message: Strings.noTransferAvailable)
        : ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Transfer item = transfers[index];
              return TransferItem(item: item);
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 8.h,
              );
            },
            itemCount: transfers.length,
          );
  }
}
