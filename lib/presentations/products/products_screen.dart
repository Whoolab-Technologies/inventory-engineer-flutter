import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/presentations/products/empty_product_list.dart';
import 'package:mvp_engineer/presentations/products/product_item_widget.dart';
import 'package:mvp_engineer/presentations/products/product_list_viewer.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
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
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<ProductsBloc>().add(const ProductsEvent.getProducts());
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
                          final message =
                              f.map(customError: (error) => error.message);
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
        ));
  }
}
