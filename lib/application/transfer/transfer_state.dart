part of 'transfer_bloc.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState({
    required bool isLoading,
    required List<Transfer> transfers,
    required Option<Either<AppFailure, List<Transfer>>>
        transfersListFailureOrSuccess,
  }) = _TransferState;
  factory TransferState.initial() => TransferState(
        isLoading: false,
        transfers: [],
        transfersListFailureOrSuccess: none(),
      );
}
