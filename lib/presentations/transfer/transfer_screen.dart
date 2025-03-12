import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/transfer/transfer_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/presentations/transfer/transfer_list_loading.dart';
import 'package:mvp_engineer/presentations/transfer/transfer_list_viewer.dart';

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
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<TransferBloc>().add(
                    const TransferEvent.getTransfers(),
                  );
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(8.w),
              child: Builder(builder: (context) {
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
            ),
          );
        },
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
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
