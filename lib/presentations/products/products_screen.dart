import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';

import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/engineer/engineer.dart';

import 'package:mvp_engineer/presentations/products/product_item_widget.dart';
import 'package:mvp_engineer/presentations/products/product_list_viewer.dart';
import 'package:mvp_engineer/presentations/scanner/qr_code_scanner_page.dart';
import 'package:mvp_shared_components/widgets/app_search_field.dart';
import 'package:mvp_shared_components/widgets/app_empty_list_container.dart';
import 'package:mvp_shared_components/widgets/app_searchable_dropdown.dart';

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
      body: BlocConsumer<ProductsBloc, ProductsState>(
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
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.w),
                child: AppSearchField(
                  hintText: Strings.seachProduct,
                  suffixIcon: _buildScannerButton(context, primaryColor),
                  onChange: (String? searchTerm) {
                    context.read<ProductsBloc>().add(
                          ProductsEvent.getProducts(searchTerm: searchTerm),
                        );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: GenericSearchableDropdown<Engineer>(
                  matchItem: (item, query) {
                    final queryLower = query.toLowerCase();
                    return [
                      item.name,
                      item.firstName,
                      item.lastName,
                    ]
                        .whereType<String>()
                        .any((val) => val.toLowerCase().contains(queryLower));
                  },
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Engineers",
                  searchHint: "Search engineers..",
                  items: state.engineers,
                  displayStringForOption: (engineer) {
                    return engineer!.name;
                  },
                  onChanged: (engineer) {
                    context.read<ProductsBloc>().add(
                          ProductsEvent.setSelectedEngineer(engineer),
                        );
                    context.read<ProductsBloc>().add(
                          ProductsEvent.getProducts(
                            searchTerm: state.searchTerm,
                            engineerId: "${engineer?.id ?? ""}",
                          ),
                        );
                  },
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    context.read<ProductsBloc>().add(ProductsEvent.getProducts(
                          searchTerm: state.searchTerm,
                          engineerId: "${state.selectedEngineer?.id ?? ""}",
                        ));
                  },
                  child: Builder(
                    builder: (_) {
                      if (state.isloading) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.all(8.w),
                          itemBuilder: (context, i) =>
                              const ProductItemShimmer(),
                          separatorBuilder: (context, i) => const Divider(),
                          itemCount: 5,
                        );
                      }
                      return Stack(
                        children: [
                          SizedBox.expand(
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              child: Column(
                                children: [
                                  state.products.isEmpty
                                      ? const AppEmptyListContainer(
                                          message: Strings.noProductsAvailable,
                                        )
                                      : ProductListViewer(
                                          products: state.products,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildScannerButton(BuildContext context, Color primaryColor) {
    return IconButton(
      icon: Icon(
        Icons.qr_code_scanner,
        color: primaryColor,
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (cxt) {
            return const QRCodeScannerPage();
          }),
        );
      },
    );
  }
}
