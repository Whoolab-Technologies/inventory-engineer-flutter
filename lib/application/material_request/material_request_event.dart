part of 'material_request_bloc.dart';

@freezed
class MaterialRequestEvent with _$MaterialRequestEvent {
  const factory MaterialRequestEvent.start() = Started;
  const factory MaterialRequestEvent.fetchMaterialRequests() =
      FetchMaterialRequests;
  const factory MaterialRequestEvent.getProducts({String? searchTerm}) =
      _OnGetProducts;
  const factory MaterialRequestEvent.getProduct({required String id}) =
      _OnGetProduct;
  const factory MaterialRequestEvent.productAdded(MaterialRequestItem item) =
      MaterialRequestProductAdded;
  const factory MaterialRequestEvent.productRemoved(MaterialRequestItem item) =
      MaterialRequestProductRemoved;
  const factory MaterialRequestEvent.descriptionChanged(String description) =
      MaterialRequestDescriptionChanged;
  const factory MaterialRequestEvent.submitted(
      List<Map<String, dynamic>>? selectedFiles) = MaterialRequestSubmitted;
}
