import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_shared_components/widgets/image_picker_button.dart';
import 'package:mvp_shared_components/widgets/image_picker_screen.dart';
import 'package:mvp_shared_components/widgets/product_search_button.dart';

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

  @override
  void initState() {
    super.initState();
    selectedProduct = widget.selectedProduct;
  }

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
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: () async {
                        final result = await showModalBottomSheet<Product>(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (_) => ProductSelectionSheet(
                            initialQuery: selectedProduct?.item,
                          ),
                        );

                        if (result != null) {
                          setState(() {
                            selectedProduct = result;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        child: selectedProduct != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${selectedProduct?.catId}",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                                  ),
                                  Text(
                                    "${selectedProduct?.item} (${selectedProduct?.symbol?.toUpperCase()})",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            : Text(
                                "Select Product",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: selectedProduct != null
                                      ? Theme.of(context).colorScheme.onSurface
                                      : Colors.grey,
                                ),
                              ),
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

class ProductSelectionSheet extends StatefulWidget {
  final String? initialQuery;

  const ProductSelectionSheet({super.key, this.initialQuery});

  @override
  State<ProductSelectionSheet> createState() => _ProductSelectionSheetState();
}

class _ProductSelectionSheetState extends State<ProductSelectionSheet> {
  String? _query;

  void _search(String? value) async {
    setState(() => _query = value);
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialQuery?.isNotEmpty ?? false) {
      _search(widget.initialQuery!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 16.h,
                top: 16.h,
                left: 16.w,
                right: 16.w,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight * 0.8,
                ),
                child: BlocConsumer<MaterialRequestBloc, MaterialRequestState>(
                  buildWhen: (previous, current) =>
                      previous.productsFailureOrSuccess !=
                      current.productsFailureOrSuccess,
                  builder: (context, state) {
                    List<Product> products = state.products;
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 70.w,
                            height: 3.h,
                            margin: EdgeInsets.only(bottom: 12.h),
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(2.r),
                            ),
                          ),
                          ProductSearchField(
                            onChange: (value) {
                              _search(value);
                              if (value == null || value.isEmpty) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              }
                              context.read<MaterialRequestBloc>().add(
                                  MaterialRequestEvent.getProducts(
                                      searchTerm: value));
                            },
                            onDecode: (value) {
                              Navigator.of(context).pop();
                              context.read<MaterialRequestBloc>().add(
                                    MaterialRequestEvent.getProduct(id: value),
                                  );
                            },
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: products.isEmpty
                                ? Center(
                                    child: Text(
                                    (_query ?? "").isNotEmpty
                                        ? "No products found for your search."
                                        : "Search and select products to continue.",
                                  ))
                                : ListView.builder(
                                    itemCount: products.length,
                                    itemBuilder: (_, index) {
                                      final product = products[index];
                                      return InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop(product);
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(4.w),
                                          child: buildProductSection(
                                              context, product),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                  listenWhen: (previous, current) =>
                      previous.productsFailureOrSuccess !=
                      current.productsFailureOrSuccess,
                  listener: (BuildContext context, MaterialRequestState state) {
                    state.productsFailureOrSuccess.fold(
                        () => null,
                        (a) => a.fold((l) {
                              String message =
                                  l.map(customError: (error) => error.message);
                              Utils.handleError(context, message);
                            }, (_) {}));
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildProductSection(context, product) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.4)),
      ),
      padding: EdgeInsets.all(8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product?.item ?? '',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4.h),
          productDetailsWidget(product),
        ],
      ),
    );
  }

  Widget productDetailsWidget(Product product) {
    TextStyle textStyle = TextStyle(
      color: const Color.fromARGB(135, 115, 6, 6),
      fontSize: 11.sp,
    );
    return RichText(
      text: TextSpan(
        style: textStyle,
        children: [
          TextSpan(
              text: product.catId ?? '',
              style: textStyle.copyWith(color: Colors.black)),
          const TextSpan(text: ' | '),
          TextSpan(
              text: product.categoryName ?? '',
              style: textStyle.copyWith(color: Colors.black)),
          const TextSpan(text: ' | '),
          TextSpan(
              text: product.productCategory ?? '',
              style: textStyle.copyWith(color: Colors.black)),
          const TextSpan(text: ' | '),
          TextSpan(
              text: product.brandName ?? '',
              style: textStyle.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}
