import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/presentations/material_requests/material_requests_create_screen.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            //  controller: scrollController,
            child: SizedBox(
              width: double.infinity,
              child: BlocConsumer<ProductsBloc, ProductsState>(
                buildWhen: (previous, current) =>
                    previous.productFailureOrSuccess !=
                        current.productFailureOrSuccess ||
                    previous.isloading != current.isloading,
                builder: (context, state) {
                  if (state.isloading) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildProductDetails(context, state),
                    ],
                  );
                },
                listenWhen: (previous, current) =>
                    previous.productFailureOrSuccess !=
                    current.productFailureOrSuccess,
                listener: (BuildContext context, ProductsState state) {
                  state.productFailureOrSuccess.fold(
                      () => null,
                      (ifSome) => ifSome.fold((l) {
                            String message =
                                l.map(customError: (error) => error.message);
                            Utils.handleError(context, message);
                          }, (_) => null));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductDetails(BuildContext context, ProductsState state) {
    return state.productFailureOrSuccess.fold(
      () => const SizedBox.shrink(),
      (a) => a.fold((l) {
        log(l.map(customError: (error) => error.message));
        return const Center(child: CircularProgressIndicator());
      }, (productData) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              // Product Information
              _buildSectionTitle("Product Information", context),
              _buildInfoRow("Item:", productData['item']),
              _buildInfoRow("Category ID:", productData['cat_id']),
              _buildInfoRow("Description:", productData['description']),
              _buildInfoRow("Unit:", productData['symbol']),

              // // QR Code
              // _buildSectionTitle("QR Code"),
              // Image.network(
              //   productData['code'],
              //   height: 150,
              //   width: 150,
              //   fit: BoxFit.cover,
              // ),
              // const SizedBox(height: 10),

              // // Product Image
              // _buildSectionTitle("Product Image"),
              // Image.network(
              //   productData['image_url'],
              //   height: 200,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(height: 10),

              // Stock Details
              _buildSectionTitle("Stocks Available", context),
              ..._buildStoreStockDetails(productData['stocks'], context),

              // Engineer Stocks
              _buildSectionTitle("Engineer Stocks", context),
              ..._buildEngineerStockDetails(
                productData['engineer_stocks'],
                context,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  context.read<ProductsBloc>().add(
                        ProductsEvent.getProducts(
                          all: true,
                        ),
                      );

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MaterialRequestCreateScreen(
                          selectedProduct: Product.fromJson(productData),
                        );
                      },
                    ),
                  );
                },
                child: const Text("Create MR"),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18.sp,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStoreStockDetails(
    List<dynamic> stocks,
    BuildContext context,
  ) {
    return stocks.isNotEmpty
        ? stocks.map((stock) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                children: [
                  Icon(Icons.store,
                      color: Theme.of(context).colorScheme.primary),
                  SizedBox(width: 10.w),
                  Expanded(child: Text("${stock['store']['name']}")),
                  Expanded(child: Text("Quantity: ${stock['quantity']}")),
                ],
              ),
            );
          }).toList()
        : [const Text("No stocks available")];
  }

  List<Widget> _buildEngineerStockDetails(
    List<dynamic> stocks,
    BuildContext context,
  ) {
    return stocks.isNotEmpty
        ? stocks.map((stock) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Row(
                children: [
                  Icon(Icons.engineering_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  SizedBox(width: 10.w),
                  Expanded(
                      child: Text(
                          "${stock['engineer']['name']} (${stock['store']['name']})")),
                  Expanded(child: Text("Quantity: ${stock['quantity']}")),
                ],
              ),
            );
          }).toList()
        : [const Text("No stocks available")];
  }
}
