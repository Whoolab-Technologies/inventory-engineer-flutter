import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/store/model/store/store.dart';
import 'package:mvp_engineer/presentations/products/empty_product_list.dart';
import 'package:mvp_engineer/presentations/products/product_item_widget.dart';

class SingleStoreProductListViewer extends StatelessWidget {
  const SingleStoreProductListViewer({super.key, required this.store});
  final Store store;
  @override
  Widget build(BuildContext context) {
    return store.products == null || store.products!.isEmpty
        ? const EmptyProductList()
        : ListView.separated(
            padding: EdgeInsets.all(8.w),
            itemCount: store.products?.length ?? 0,
            itemBuilder: (context, productIndex) {
              final product = store.products?[productIndex];
              return ProductItemWidget(
                productName: product?.item ?? "",
                description: product?.itemDescription ?? "No description",
                imageUrl: product?.imageUrl ?? "",
                isStockIn: product?.inStock ?? false,
                stockCount: product?.stockCount ?? 0,
              );
            },
            separatorBuilder: (context, i) => const Divider(),
          );
  }
}
