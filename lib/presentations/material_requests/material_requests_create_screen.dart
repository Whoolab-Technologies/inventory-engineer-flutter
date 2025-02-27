import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';

import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/injection/injection.dart';
import 'package:mvp_engineer/presentations/widgets/app_custom_dropdown.dart';
import 'package:mvp_engineer/presentations/widgets/app_shimmer.dart';

class MaterialRequestCreateScreen extends StatelessWidget {
  const MaterialRequestCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Create MR',
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      )),
      body: BlocProvider(
        create: (context) => getIt<MaterialRequestBloc>(),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: const MaterialRequestForm(),
        ),
      ),
    );
  }
}

class MaterialRequestForm extends StatefulWidget {
  const MaterialRequestForm({super.key});

  @override
  State<MaterialRequestForm> createState() => _MaterialRequestFormState();
}

class _MaterialRequestFormState extends State<MaterialRequestForm> {
  final _formKey = GlobalKey<FormState>();
  List<MaterialRequestItem> items = [];
  List<Product> products = [];
  Product? selectedProduct;
  TextEditingController quantityController = TextEditingController();

  void _addProduct() {
    if (selectedProduct != null && quantityController.text.isNotEmpty) {
      setState(() {
        MaterialRequestItem existingItem = items.firstWhere(
          (item) => item.productId == selectedProduct!.id,
        );
        log("existingItem ${existingItem}");
        Utils.handleError(context, Strings.productAlreadyAdded);
      });

      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      log("${state.products}");

                      return state.isloading
                          ? AppShimmer(
                              child: Container(
                                height: 54.h,
                                color: Colors.grey[300],
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: AppCustomDropdown<Product>(
                                items: state.products,
                                value: selectedProduct,
                                label: Strings.productLabel,
                                placeholder: Strings.productPlaceHolder,
                                itemToString: (p0) => p0.toString(),
                                onChanged: (p0) {
                                  setState(() {
                                    selectedProduct = p0;
                                  });
                                },
                                itemDisplayText: (p0) {
                                  return "${p0.item} (${(p0.symbol ?? "").toUpperCase()})";
                                },
                              ),
                            );
                    },
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
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 24.h),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      items[index].productName ?? "",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      '${Strings.quantityLabel}: ${items[index].quantity}',
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () {
                        setState(() {
                          items.removeAt(index);
                        });
                        context.read<MaterialRequestBloc>().add(
                            MaterialRequestEvent.productAdded(items[index]));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context
                    .read<MaterialRequestBloc>()
                    .add(const MaterialRequestSubmitted());
              }
            },
            child: const Text(Strings.submit),
          )
        ],
      ),
    );
  }
}
