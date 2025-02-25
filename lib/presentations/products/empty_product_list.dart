import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyProductList extends StatelessWidget {
  const EmptyProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No products available',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
