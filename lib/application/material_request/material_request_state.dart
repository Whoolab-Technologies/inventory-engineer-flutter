part of 'material_request_bloc.dart';

@freezed
class MaterialRequestState with _$MaterialRequestState {
  const factory MaterialRequestState({
    required List<Map<String, dynamic>> mrItems,
    required String description,
    required List<MaterialRequest> materialRequests,
    required Option<Either<AppFailure, List<MaterialRequest>>>
        materialRequestsFailureOrSuccess,
    required bool isLoading,
  }) = _MaterialRequestState;

  factory MaterialRequestState.initial() => MaterialRequestState(
        mrItems: [],
        description: '',
        materialRequests: [],
        isLoading: false,
        materialRequestsFailureOrSuccess: none(),
      );
}
