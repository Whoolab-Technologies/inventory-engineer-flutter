import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/material_return/material_return_bloc.dart';
import 'package:mvp_engineer/core/routes/routes.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_shared_components/widgets/app_searchable_dropdown.dart';
import 'package:mvp_shared_components/widgets/app_shimmer.dart';

class MaterialReturnScreen extends StatefulWidget {
  const MaterialReturnScreen({super.key});

  @override
  State<MaterialReturnScreen> createState() => _MaterialReturnScreenState();
}

class _MaterialReturnScreenState extends State<MaterialReturnScreen> {
  Product? selectedProduct;

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
        actions: [
          IconButton(
            onPressed: () {
              context.read<MaterialReturnBloc>().add(
                    const MaterialReturnEvent.getProductsList(),
                  );
              Navigator.of(context).pushNamed(AppRoutes.MATERIAL_RETURN);
            },
            icon: const Icon(
              Icons.add_circle_outline,
            ),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // context.read<MaterialRequestBloc>().add(
          //       const MaterialRequestEvent.fetchMaterialRequests(),
          //     );
        },
        child: Column(children: [
          BlocConsumer<MaterialReturnBloc, MaterialReturnState>(
              listener: (context, state) {
            state.materialReturnCreateFailureOrsuccess.fold(
                () => null,
                (ifSome) => ifSome.fold((f) {
                      String message =
                          f.map(customError: (error) => error.message);
                      Utils.handleError(context, message);
                    }, (r) {
                      Utils.handleSuccess(context,
                          "Material return request created successfully");
                    }));
          }, builder: (context, state) {
            return Column(children: [
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
                          ].whereType<String>().any(
                              (val) => val.toLowerCase().contains(queryLower));
                        },
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        items: state.products,
                        hintText: Strings.productPlaceHolder,
                        searchHint: "Search products..",
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
                                  e != null && e.toString().trim().isNotEmpty)
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
                  // controller: quantityController,
                  decoration:
                      const InputDecoration(labelText: Strings.quantityLabel),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(Strings.addProduct),
                ),
              ),
            ]);
          }),
        ]),
      ),
    );
  }
}
