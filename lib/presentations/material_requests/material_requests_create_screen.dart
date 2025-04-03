import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_shared_components/widgets/app_custom_dropdown.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';

class MaterialRequestCreateScreen extends StatelessWidget {
  const MaterialRequestCreateScreen({super.key, this.selectedProduct});
  final Product? selectedProduct;
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
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: MaterialRequestForm(selectedProduct: selectedProduct),
      ),
    );
  }
}

class MaterialRequestForm extends StatefulWidget {
  const MaterialRequestForm({super.key, required this.selectedProduct});
  final Product? selectedProduct;

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
      List<MaterialRequestItem>? existingItem =
          items.where((item) => item.productId == selectedProduct!.id).toList();
      if (existingItem.isNotEmpty) {
        Utils.handleError(context, Strings.productAlreadyAdded);
      } else {
        MaterialRequestItem item = MaterialRequestItem(
            productId: selectedProduct!.id,
            productName: selectedProduct!.item,
            quantity: int.parse(quantityController.text));
        items.add(item);

        quantityController.clear();
        selectedProduct = null;
        setState(() {});
        context
            .read<MaterialRequestBloc>()
            .add(MaterialRequestEvent.productAdded(item));
      }

      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaterialRequestBloc, MaterialRequestState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading,
      listener: (context, state) {
        state.materialRequestsCreateFailureOrSuccess.fold(
          () => null,
          (a) => a.fold(
            (l) {
              String message = l.map(customError: (error) => error.message);
              Utils.handleError(context, message);
            },
            (r) {
              setState(() {
                items = [];
                selectedProduct = null;
              });
              quantityController.clear();
              Navigator.of(context).pop(true);
              Utils.handleSuccess(context, Strings.mrCreateSuccess);
            },
          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    BlocConsumer<ProductsBloc, ProductsState>(
                      builder: (context, state) {
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
                      listenWhen: (previous, current) =>
                          previous.isloading != current.isloading ||
                          previous.products != current.products ||
                          previous.products.length != current.products.length,
                      listener: (BuildContext context, ProductsState state) {
                        setState(() {
                          if (state.products.isNotEmpty &&
                              widget.selectedProduct != null) {
                            selectedProduct = state.products.any((product) =>
                                    product.id == widget.selectedProduct?.id)
                                ? state.products.firstWhere((product) =>
                                    product.id == widget.selectedProduct?.id)
                                : null;
                          } else {
                            selectedProduct = null;
                          }
                        });
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
                          context.read<MaterialRequestBloc>().add(
                              MaterialRequestEvent.productRemoved(
                                  items[index]));
                          setState(() {
                            items.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            BlocBuilder<MaterialRequestBloc, MaterialRequestState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.isLoading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate() &&
                              state.mrItems.isNotEmpty) {
                            context
                                .read<MaterialRequestBloc>()
                                .add(const MaterialRequestSubmitted());
                          }
                        },
                  child: state.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(Strings.submit),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
