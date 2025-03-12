import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/transfer/transfer_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:mvp_shared_components/core/extensions.dart';
import 'package:mvp_shared_components/widgets/app_empty_list_container.dart';
import 'package:mvp_shared_components/widgets/app_status_container.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MR Transfer',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
      ),
      body: BlocConsumer<TransferBloc, TransferState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(8.w),
            child: Builder(builder: (context) {
              log("state.isLoading ${state.isLoading}");
              if (state.isLoading) {
                return const TransferListLoading();
              }
              return state.transfersListFailureOrSuccess.fold(
                () => const SizedBox.shrink(),
                (a) => a.fold(
                  (l) {
                    return const TransferListLoading();
                  },
                  (r) => TransferListViewer(
                    transfers: r,
                  ),
                ),
              );
            }),
          );
        },
        listener: (context, state) {
          state.transfersListFailureOrSuccess.fold(
            () => null,
            (ifSome) => ifSome.fold(
              (f) {
                String message = f.map(customError: (error) => error.message);
                Utils.handleError(context, message);
              },
              (_) => null,
            ),
          );
        },
      ),
    );
  }
}

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
                    ...(item.notes ?? []).map(
                      (el) => Column(
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.note_alt_outlined,
                                size: 14.sp,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                el.note ?? "",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
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

class TransferListLoading extends StatelessWidget {
  const TransferListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const SizedBox();
      },
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: 10,
    );
  }
}
