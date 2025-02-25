part of 'material_request_bloc.dart';

@freezed
class MaterialRequestEvent with _$MaterialRequestEvent {
  const factory MaterialRequestEvent.fetchMaterialRequests() =
      FetchMaterialRequests;

  const factory MaterialRequestEvent.productAdded(
      String product, int quantity) = MaterialRequestProductAdded;
  const factory MaterialRequestEvent.productRemoved(String product) =
      MaterialRequestProductRemoved;
  const factory MaterialRequestEvent.descriptionChanged(String description) =
      MaterialRequestDescriptionChanged;
  const factory MaterialRequestEvent.submitted() = MaterialRequestSubmitted;
}
