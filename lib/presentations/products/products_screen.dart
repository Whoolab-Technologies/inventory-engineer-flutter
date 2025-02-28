import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/presentations/products/empty_product_list.dart';
import 'package:mvp_engineer/presentations/products/product_item_widget.dart';
import 'package:mvp_engineer/presentations/products/product_list_viewer.dart';
import 'package:mvp_engineer/presentations/scanner/qr_scnner_page.dart';
import 'package:mvp_engineer/presentations/widgets/app_search_field.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  Widget _buildScannerButton(BuildContext context, Color primaryColor) {
    return IconButton(
      icon: Icon(
        Icons.qr_code_scanner,
        color: primaryColor,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (cxt) {
            return const QRVScannerPage();
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Products',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            AppSearchField(
              hintText: Strings.seachProduct,
              suffixIcon: _buildScannerButton(context, primaryColor),
              onChange: (String? searchTerm) {
                log("searchTerm $searchTerm");
                context.read<ProductsBloc>().add(
                      ProductsEvent.getProducts(searchTerm: searchTerm),
                    );
              },
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context
                      .read<ProductsBloc>()
                      .add(const ProductsEvent.getProducts());
                },
                child: BlocConsumer<ProductsBloc, ProductsState>(
                  listenWhen: (previous, current) =>
                      previous.productListFailureOrSuccess !=
                      current.productListFailureOrSuccess,
                  listener: (context, state) {
                    state.productListFailureOrSuccess.fold(
                        () => null,
                        (a) => {
                              a.fold((f) {
                                final message = f.map(
                                    customError: (error) => error.message);
                                Utils.handleError(context, message);
                              }, (_) => null)
                            });
                  },
                  builder: (context, state) {
                    if (state.isloading) {
                      return ListView.separated(
                        padding: EdgeInsets.all(8.w),
                        itemBuilder: (context, i) => const ProductItemShimmer(),
                        separatorBuilder: (context, i) => const Divider(),
                        itemCount: 5,
                      );
                    }

                    return state.products.isEmpty
                        ? const EmptyProductList()
                        : ProductListViewer(
                            products: state.products,
                          );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
