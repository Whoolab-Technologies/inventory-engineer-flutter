part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required bool isloading,
    required List<Product> products,
    required String? searchTerm,
    required Option<Either<AppFailure, List<Product>>>
        productListFailureOrSuccess,
    required Option<Either<AppFailure, Map<String, dynamic>>>
        productFailureOrSuccess,
    required Option<Either<AppFailure, Map<String, dynamic>>>
        storesAndEngineersFailureOrSuccess,
    required Engineer? selectedEngineer,
    required Store? selectedStore,
    required List<Store> stores,
    required List<Engineer> engineers,
  }) = _ProductsState;
  factory ProductsState.state() => ProductsState(
        isloading: true,
        products: [],
        stores: [],
        engineers: [],
        searchTerm: "",
        selectedStore: null,
        selectedEngineer: null,
        productListFailureOrSuccess: none(),
        productFailureOrSuccess: none(),
        storesAndEngineersFailureOrSuccess: none(),
      );
}
