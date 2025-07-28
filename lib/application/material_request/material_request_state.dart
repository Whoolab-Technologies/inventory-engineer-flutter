part of 'material_request_bloc.dart';

@freezed
class MaterialRequestState with _$MaterialRequestState {
  const factory MaterialRequestState({
    required List<MaterialRequestItem> mrItems,
    required String description,
    required List<MaterialRequest> materialRequests,
    required Option<Either<AppFailure, List<MaterialRequest>>>
        materialRequestsFailureOrSuccess,
    required Option<Either<AppFailure, List<Product>>> productsFailureOrSuccess,
    required Option<Either<AppFailure, MaterialRequest>>
        materialRequestsCreateFailureOrSuccess,
    required bool isLoading,
    required List<Product> products,
  }) = _MaterialRequestState;

  factory MaterialRequestState.initial() => MaterialRequestState(
        mrItems: [],
        description: '',
        materialRequests: [],
        products: [],
        isLoading: false,
        productsFailureOrSuccess: none(),
        materialRequestsFailureOrSuccess: none(),
        materialRequestsCreateFailureOrSuccess: none(),
      );
}
