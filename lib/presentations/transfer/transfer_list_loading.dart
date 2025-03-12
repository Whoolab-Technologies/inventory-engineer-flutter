import 'package:flutter/material.dart';
import 'package:mvp_engineer/presentations/transfer/transfer_item_shimmer.dart';

class TransferListLoading extends StatelessWidget {
  const TransferListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const TransferItemShimmer();
      },
      separatorBuilder: (context, index) {
        return const SizedBox();
      },
      itemCount: 10,
    );
  }
}
