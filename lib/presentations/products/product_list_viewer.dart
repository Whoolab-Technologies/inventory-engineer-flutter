import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/presentations/products/product_item_widget.dart';

class ProductListViewer extends StatelessWidget {
  const ProductListViewer({super.key, required this.products});
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(8.w),
      itemCount: products.length,
      itemBuilder: (context, productIndex) {
        final product = products[productIndex];
        return ProductItemWidget(
          productName: product.item ?? "",
          description: product.description ?? "No description",
          imageUrl: product.imageUrl ?? "",
          isStockIn: product.isStockIn,
          stockCount: product.myStock ?? 0,
          stockWithOthers: product.stockWithOthers ?? 0,
        );
      },
      separatorBuilder: (context, i) => const Divider(),
    );
  }
}
