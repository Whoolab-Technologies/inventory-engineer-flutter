part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.started() = _Started;
  factory ProductsEvent.getProducts(
      {bool? all, String? searchTerm, String? engineerId}) = _GetProducts;
  factory ProductsEvent.getAllProducts() = _GetAllProducts;
  const factory ProductsEvent.getProduct({required String productId}) =
      _GetProduct;
  const factory ProductsEvent.getStoresAndEngineer() = _GetStoresAndEngineers;

  const factory ProductsEvent.setSelectedEngineer(Engineer? enginer) =
      _OnSetSelectedEngineer;
  const factory ProductsEvent.setSelectedStore(Store? store) =
      _OnSetSelectedStore;
}
