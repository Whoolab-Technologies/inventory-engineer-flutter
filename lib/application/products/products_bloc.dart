import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/domain/product/i_product_facade.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final IProductFacade _iProductFacade;
  ProductsBloc(this._iProductFacade) : super(ProductsState.state()) {
    on<_GetProducts>((event, emit) async {
      emit(state.copyWith(isloading: true, products: []));

      Either<AppFailure, List<Product>> productListFailureOrSuccess =
          await _iProductFacade.getProducts(searchTerm: event.searchTerm);

      emit(
        state.copyWith(
          isloading: false,
          searchTerm: event.searchTerm,
          products: productListFailureOrSuccess.fold((l) => [], (r) => r),
          productListFailureOrSuccess: optionOf(productListFailureOrSuccess),
        ),
      );
    });
  }
}
