part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required bool isloading,
    required List<Store> stores,
    required Option<Either<AppFailure, List<Store>>> storeListFailureOrSuccess,
  }) = _ProductsState;
  factory ProductsState.state() => ProductsState(
        isloading: true,
        stores: [],
        storeListFailureOrSuccess: none(),
      );
}
