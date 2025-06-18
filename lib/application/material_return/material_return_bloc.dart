import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/materal_return/i_material_return_facade.dart';
import 'package:mvp_engineer/domain/models/material_return/material_return.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'material_return_event.dart';
part 'material_return_state.dart';
part 'material_return_bloc.freezed.dart';

@injectable
class MaterialReturnBloc
    extends Bloc<MaterialReturnEvent, MaterialReturnState> {
  final IMaterialReturnFacade _iMaterialReturnFacade;

  final Map<String, CancelToken> _cancelTokens = {};
  MaterialReturnBloc(this._iMaterialReturnFacade)
      : super(MaterialReturnState.initial()) {
    on<_OnGetMaterialReturnList>(_onGetMaterialReturnList);
    on<_OnGetProductsList>(_onGetProductsList);
    on<_OnSubmitMaterialReturnRequest>(_onSubmitMaterialReturnRequest);
  }

  FutureOr<void> _onSubmitMaterialReturnRequest(
      _OnSubmitMaterialReturnRequest event,
      Emitter<MaterialReturnState> emit) async {
    emit(state.copyWith(
      uploading: true,
      materialReturnCreateFailureOrsuccess: none(),
    ));
    List<MaterialReturn> items = List<MaterialReturn>.from(state.items);
    Either<AppFailure, MaterialReturn> result =
        await _iMaterialReturnFacade.createMaterialReturn(event.request);
    result.foldRight(null, (r, __) {
      items.insert(0, r);
    });

    emit(state.copyWith(
      uploading: false,
      items: items,
      materialReturnCreateFailureOrsuccess: optionOf(result),
      materialReturnListFailureOrsuccess: optionOf(right(items)),
    ));
  }

  FutureOr<void> _onGetMaterialReturnList(
      _OnGetMaterialReturnList event, Emitter<MaterialReturnState> emit) async {
    _cancelTokens['return']?.cancel();
    _cancelTokens['return'] = CancelToken();

    try {
      emit(state.copyWith(
        isloading: true,
        materialReturnListFailureOrsuccess: none(),
      ));
      Either<AppFailure, List<MaterialReturn>> result =
          await _iMaterialReturnFacade.getMaterialReturnList(
              cancelToken: _cancelTokens['return']);

      emit(state.copyWith(
        isloading: false,
        items: result.getOrElse(() => []),
        materialReturnListFailureOrsuccess: optionOf(result),
      ));
    } finally {
      _cancelTokens.remove('return');
    }
  }

  FutureOr<void> _onGetProductsList(
      _OnGetProductsList event, Emitter<MaterialReturnState> emit) async {
    _cancelTokens['return_products']?.cancel();
    _cancelTokens['return_products'] = CancelToken();

    try {
      emit(state.copyWith(
        isloading: true,
        getProductsFailureOrSuccess: none(),
      ));
      Either<AppFailure, List<Product>> result = await _iMaterialReturnFacade
          .getProductsList(cancelToken: _cancelTokens['return_products']);

      emit(state.copyWith(
        isloading: false,
        products: result.getOrElse(() => []),
        getProductsFailureOrSuccess: optionOf(result),
      ));
    } finally {
      _cancelTokens.remove('return_products');
    }
  }
}
