import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:mvp_engineer/domain/transfer/i_transfer_facade.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
part 'transfer_bloc.freezed.dart';
part 'transfer_event.dart';
part 'transfer_state.dart';

@injectable
class TransferBloc extends Bloc<TransferEvent, TransferState> {
  final ITransferFacade _iTransferFacade;
  TransferBloc(this._iTransferFacade) : super(TransferState.initial()) {
    on<_GetTransfers>(_onGetTransfers, transformer: restartable());
  }

  FutureOr<void> _onGetTransfers(
      _GetTransfers event, Emitter<TransferState> emit) async {
    emit(
      state.copyWith(
        isLoading: true,
        transfers: [],
        transfersListFailureOrSuccess: none(),
      ),
    );
    Either<AppFailure, List<Transfer>> transfersListFailureOrSuccess =
        await _iTransferFacade.getTransfers();
    emit(
      state.copyWith(
        isLoading: false,
        transfers: transfersListFailureOrSuccess.fold(
          (_) => [],
          (list) => list,
        ),
        transfersListFailureOrSuccess: optionOf(transfersListFailureOrSuccess),
      ),
    );
  }
}
