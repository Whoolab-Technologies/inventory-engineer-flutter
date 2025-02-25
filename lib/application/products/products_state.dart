part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required bool isloading,
    required List<Product> products,
    required Option<Either<AppFailure, List<Product>>>
        productListFailureOrSuccess,
  }) = _ProductsState;
  factory ProductsState.state() => ProductsState(
        isloading: true,
        products: [],
        productListFailureOrSuccess: none(),
      );
}
