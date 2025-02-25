import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/domain/store/model/store/store.dart';
import 'package:mvp_engineer/presentations/products/product_item_widget.dart';

class MultiStoreProductListViewer extends StatelessWidget {
  const MultiStoreProductListViewer({super.key, required this.stores});
  final List<Store> stores;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: stores.length,
      child: Column(
        children: [
          // Store Tabs
          TabBar(
            isScrollable: true, // Scrollable if many stores
            tabs: stores.map((store) {
              return Tab(text: store.name ?? "Store");
            }).toList(),
          ),

          // Store Product Lists
          Expanded(
            child: TabBarView(
              children: stores.map((store) {
                return ListView.separated(
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
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
