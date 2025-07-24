import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_shared_components/widgets/app_searchable_dropdown.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';
import 'package:mvp_shared_components/widgets/image_picker_button.dart';
import 'package:mvp_shared_components/widgets/image_picker_screen.dart';

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
  List<Map<String, dynamic>> _selectedFiles = [];

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
          quantity: int.parse(quantityController.text),
          catId: selectedProduct!.catId,
          categoryName: selectedProduct!.categoryName,
          brandName: selectedProduct!.brandName,
          productCategory: selectedProduct!.productCategory,
        );
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

  Future<void> _navigateAndPickImages() async {
    FocusScope.of(context).requestFocus(FocusNode());
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    final List<Map<String, dynamic>>? selectedFiles = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImagePickerScreen(
          selectedFiles: _selectedFiles,
        ),
      ),
    );

    if (selectedFiles != null) {
      setState(() {
        _selectedFiles = selectedFiles;
      });
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
                    ImagePickerButton(
                      selectedFiles: _selectedFiles,
                      onImagesSelected: _navigateAndPickImages,
                    ),
                    BlocConsumer<ProductsBloc, ProductsState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: state.isloading
                              ? AppShimmer(height: 46.h, width: double.infinity)
                              : GenericSearchableDropdown<Product>(
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
                                  displayStringForOption: (p0) {
                                    return "${p0!.item} (${(p0.symbol ?? "").toUpperCase()})";
                                  },
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  items: state.allProducts,
                                  hintText: Strings.productPlaceHolder,
                                  searchHint: "Search products..",
                                  onChanged: (p0) {
                                    setState(() {
                                      selectedProduct = p0;
                                    });
                                  },
                                ),
                        );
                        //   child: AppCustomDropdown<Product>(
                        //     items: state.products,
                        //     value: selectedProduct,
                        //     label: Strings.productLabel,
                        //     placeholder: Strings.productPlaceHolder,
                        //     itemToString: (p0) => p0.toString(),
                        //     onChanged: (p0) {
                        //       setState(() {
                        //         selectedProduct = p0;
                        //       });
                        //     },
                        //     itemDisplayText: (p0) {
                        //       return "${p0.item} (${(p0.symbol ?? "").toUpperCase()})";
                        //     },
                        //   ),
                        // );
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
                  final item = items[index];
                  return Card(
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.productName ?? "",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey[700]),
                              children: [
                                TextSpan(
                                  text: item.catId ?? '-',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const TextSpan(
                                    text: ' | ',
                                    style: TextStyle(color: Colors.grey)),
                                TextSpan(
                                  text: item.productCategory ?? '-',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const TextSpan(
                                    text: ' | ',
                                    style: TextStyle(color: Colors.grey)),
                                TextSpan(
                                  text: item.categoryName ?? '-',
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const TextSpan(
                                    text: ' | ',
                                    style: TextStyle(color: Colors.grey)),
                                TextSpan(
                                  text: item.brandName ?? '-',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        '${Strings.quantityLabel}: ${items[index].quantity}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
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
                                .add(MaterialRequestSubmitted(_selectedFiles));
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
