part of 'material_return_bloc.dart';

@freezed
class MaterialReturnEvent with _$MaterialReturnEvent {
  const factory MaterialReturnEvent.getMaterialReturnList() =
      _OnGetMaterialReturnList;
  const factory MaterialReturnEvent.getProductsList() = _OnGetProductsList;
  const factory MaterialReturnEvent.submitMaterialReturnRequest(
      Map<String, dynamic> request) = _OnSubmitMaterialReturnRequest;
}
