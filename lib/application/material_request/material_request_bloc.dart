import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/domain/material_request/i_material_request_facade.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'material_request_event.dart';
part 'material_request_state.dart';
part 'material_request_bloc.freezed.dart';

@injectable
class MaterialRequestBloc
    extends Bloc<MaterialRequestEvent, MaterialRequestState> {
  final IMaterialRequestFacade _iMaterialRequestRepo;
  final Map<String, CancelToken> _cancelTokens = {};
  MaterialRequestBloc(this._iMaterialRequestRepo)
      : super(MaterialRequestState.initial()) {
    on<FetchMaterialRequests>(
      _onGetchMaterialRequests,
      transformer: restartable(),
    );
    on<_OnGetProducts>(
      _onGetProducts,
      transformer: restartable(),
    );
    on<_OnGetProduct>(
      _onGetProduct,
      transformer: restartable(),
    );
    on<Started>((event, emit) {
      emit(state.copyWith(mrItems: []));
    });

    on<MaterialRequestProductAdded>((MaterialRequestProductAdded event,
        Emitter<MaterialRequestState> emit) {
      final updatedProducts = List<MaterialRequestItem>.from(state.mrItems)
        ..add(event.item);
      emit(state.copyWith(mrItems: updatedProducts));
    });

    on<MaterialRequestProductRemoved>((event, emit) {
      final updatedProducts = state.mrItems
          .where((p) => p.productId != event.item.productId)
          .toList();
      emit(state.copyWith(mrItems: updatedProducts));
    });

    on<MaterialRequestDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<MaterialRequestSubmitted>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        materialRequestsFailureOrSuccess: none(),
        materialRequestsCreateFailureOrSuccess: none(),
      ));

      final updatedMaterialRequests =
          List<MaterialRequest>.from(state.materialRequests);

      final result = await _iMaterialRequestRepo.postMaterialRequests(
        state.mrItems,
        event.selectedFiles,
      );

      result.foldRight(null, (mr, _) {
        updatedMaterialRequests.insert(0, mr);
      });

      emit(state.copyWith(
        isLoading: false,
        mrItems: result.isRight() ? [] : state.mrItems,
        materialRequests: updatedMaterialRequests,
        materialRequestsFailureOrSuccess:
            optionOf(right(updatedMaterialRequests)),
        materialRequestsCreateFailureOrSuccess: optionOf(result),
      ));
    });
  }

  FutureOr<void> _onGetProducts(
      _OnGetProducts event, Emitter<MaterialRequestState> emit) async {
    _cancelTokens['products']?.cancel();
    _cancelTokens['products'] = CancelToken();

    try {
      emit(
        state.copyWith(
          productsFailureOrSuccess: none(),
        ),
      );

      Either<AppFailure, List<Product>> result =
          await _iMaterialRequestRepo.getProducts(searchTerm: event.searchTerm);
      List<Product> products = result.fold((_) => [], (r) => r);
      emit(state.copyWith(
        products: products,
        productsFailureOrSuccess: optionOf(result),
      ));
    } finally {
      _cancelTokens.remove('products');
    }
  }

  FutureOr<void> _onGetProduct(
      _OnGetProduct event, Emitter<MaterialRequestState> emit) async {
    _cancelTokens['product']?.cancel();
    _cancelTokens['product'] = CancelToken();

    try {
      emit(
        state.copyWith(
          productsFailureOrSuccess: none(),
        ),
      );

      Either<AppFailure, List<Product>> result =
          await _iMaterialRequestRepo.getProduct(id: event.id);
      List<Product> products = result.fold((_) => [], (r) => r);
      emit(state.copyWith(
        products: products,
        productsFailureOrSuccess: optionOf(result),
      ));
    } finally {
      _cancelTokens.remove('product');
    }
  }

  FutureOr<void> _onGetchMaterialRequests(
      FetchMaterialRequests event, Emitter<MaterialRequestState> emit) async {
    _cancelTokens['requests']?.cancel();
    _cancelTokens['requests'] = CancelToken();

    try {
      emit(state.copyWith(
          isLoading: true, materialRequestsFailureOrSuccess: none()));
      Either<AppFailure, List<MaterialRequest>> result =
          await _iMaterialRequestRepo.fetchMaterialRequests();
      Utils.handleApiResponse("Material requests", result);
      List<MaterialRequest> materialRequests = result.fold((_) => [], (r) => r);

      emit(state.copyWith(
        isLoading: false,
        materialRequests: materialRequests,
        materialRequestsFailureOrSuccess: optionOf(result),
      ));
    } finally {
      _cancelTokens.remove('requests');
    }
  }
}
