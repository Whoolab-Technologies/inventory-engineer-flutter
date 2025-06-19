import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_return/material_return_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_shared_components/widgets/app_searchable_dropdown.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';

class MaterialReturnCreateScreen extends StatefulWidget {
  const MaterialReturnCreateScreen({super.key});

  @override
  State<MaterialReturnCreateScreen> createState() =>
      _MaterialReturnCreateScreenState();
}

class _MaterialReturnCreateScreenState
    extends State<MaterialReturnCreateScreen> {
  Product? selectedProduct;
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController dnNumberController = TextEditingController();
  final List<Map<String, dynamic>> selectedProducts = [];

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  void _addProduct() {
    final quantity = int.tryParse(quantityController.text);

    if (selectedProduct == null) {
      Utils.handleError(context, "Please select a product");
      return;
    }

    if (quantity == null || quantity <= 0) {
      Utils.handleError(context, "Enter a valid quantity");
      return;
    }

    final alreadyAdded =
        selectedProducts.any((e) => e['product'].id == selectedProduct!.id);
    if (alreadyAdded) {
      Utils.handleError(context, "Product already added");
      return;
    }

    setState(() {
      selectedProducts.add({'product': selectedProduct!, 'quantity': quantity});
      selectedProduct = null;
      quantityController.clear();
    });
  }

  void _removeProduct(int index) {
    setState(() {
      selectedProducts.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.materialReturn,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: BlocConsumer<MaterialReturnBloc, MaterialReturnState>(
            listener: (context, state) {
              state.materialReturnCreateFailureOrsuccess.fold(
                () => null,
                (either) => either.fold(
                  (f) => Utils.handleError(
                    context,
                    f.map(customError: (error) => error.message),
                  ),
                  (r) {
                    Utils.handleSuccess(context,
                        "Material return request created successfully");
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
            builder: (context, state) {
              return SingleChildScrollView(
                  padding: EdgeInsets.all(8.w),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        controller: dnNumberController,
                        decoration:
                            const InputDecoration(labelText: "DN Number"),
                      ),
                    ),
                    Divider(
                      height: 4.h,
                    ),
                    state.isloading
                        ? AppShimmer(
                            child: Container(
                              height: 54.h,
                              color: Colors.grey[300],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.h),
                            child: GenericSearchableDropdown<Product>(
                              selectedItem: selectedProduct,
                              matchItem: (item, query) {
                                final queryLower = query.toLowerCase();
                                return [
                                  item.catId,
                                  item.brandName,
                                  item.productCategory,
                                  item.item,
                                ].whereType<String>().any((val) =>
                                    val.toLowerCase().contains(queryLower));
                              },
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ),
                              items: state.products,
                              hintText: Strings.productPlaceHolder,
                              searchHint: "Search products..",
                              displayStringForOption: (p0) =>
                                  "${p0!.item} (${(p0.symbol ?? "").toUpperCase()})",
                              displaySubStringForOption: (p0) {
                                final parts = [
                                  p0?.catId,
                                  p0?.brandName,
                                  p0?.productCategory,
                                ]
                                    .where((e) =>
                                        e != null &&
                                        e.toString().trim().isNotEmpty)
                                    .toList();

                                return parts.join(" | ");
                              },
                              onChanged: (p0) {
                                setState(() {
                                  selectedProduct = p0;
                                });
                              },
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: TextFormField(
                        controller: quantityController,
                        decoration: const InputDecoration(
                            labelText: Strings.quantityLabel),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: OutlinedButton(
                        onPressed: _addProduct,
                        child: const Text(Strings.addProduct),
                      ),
                    ),
                    if (selectedProducts.isNotEmpty) ...[
                      Divider(
                        height: 8.h,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selectedProducts.length,
                        itemBuilder: (context, index) {
                          final product =
                              selectedProducts[index]['product'] as Product;
                          final quantity =
                              selectedProducts[index]['quantity'] as int;

                          return Stack(
                            children: [
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 4.h),
                                child: ListTile(
                                  title: Text(
                                    "${product.item} (${product.symbol?.toUpperCase() ?? ""})",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${product.catId} | ${product.brandName} | ${product.productCategory}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  trailing: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Qty: $quantity",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _removeProduct(index),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ]));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.w),
          child: BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
            builder: (context, state) {
              if (state.uploading) {
                final primaryColor = Theme.of(context).colorScheme.primary;

                if (state.uploading) {
                  return Container(
                    width: double.infinity,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
              }
              return ElevatedButton(
                  onPressed: () {
                    final products = selectedProducts
                        .map((e) => {
                              "product_id": e['product'].id,
                              'issued': e['quantity']
                            })
                        .toList();
                    Map<String, dynamic> request = {
                      "products": products,
                      "dn_number": dnNumberController.text
                    };
                    context.read<MaterialReturnBloc>().add(
                        MaterialReturnEvent.submitMaterialReturnRequest(
                            request));
                  },
                  child: const Text("Submit "));
            },
          ),
        )
      ]),
    );
  }
}
