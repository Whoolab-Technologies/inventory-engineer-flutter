import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/models/engineer/engineer.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/domain/models/store/store.dart';
import 'package:mvp_engineer/domain/product/i_product_facade.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final IProductFacade _iProductFacade;
  final Map<String, CancelToken> _cancelTokens = {};
  ProductsBloc(this._iProductFacade) : super(ProductsState.state()) {
    on<_GetAllProducts>(_onGetAllProducts, transformer: restartable());
    on<_GetProducts>(_onGetProducts, transformer: restartable());
    on<_GetProduct>(_onGetProduct, transformer: restartable());
    on<_GetStoresAndEngineers>(
      _onGetStoresAndEngineers,
      transformer: restartable(),
    );

    on<_OnSetSelectedEngineer>(
      (event, emit) {
        emit(state.copyWith(selectedEngineer: event.enginer));
      },
    );
    on<_OnSetSelectedStore>(
      (event, emit) {
        emit(state.copyWith(selectedStore: event.store));
      },
    );
  }

  Future<void> _onGetStoresAndEngineers(
    _GetStoresAndEngineers event,
    Emitter<ProductsState> emit,
  ) async {
    _cancelTokens['stores_engineers']?.cancel();
    final token = CancelToken();
    _cancelTokens['stores_engineers'] = token;

    emit(state.copyWith(storesAndEngineersFailureOrSuccess: none()));

    try {
      final result = await _iProductFacade.getStoresAndEngineer(
        cancelToken: token,
      );

      // prepare new values depending on success / failure
      final newStores = result.fold<List<Store>>(
        (_) => [],
        (data) => data['stores'] ?? [],
      );

      final newEngineers = result.fold<List<Engineer>>(
        (_) => [],
        (data) => data['engineers'] ?? [],
      );

      emit(
        state.copyWith(
          stores: newStores,
          engineers: newEngineers,
          storesAndEngineersFailureOrSuccess: optionOf(result),
        ),
      );
    } finally {
      _cancelTokens.remove('stores_engineers');
    }
  }

  FutureOr<void> _onGetProduct(event, Emitter<ProductsState> emit) async {
    _cancelTokens['product']?.cancel();
    _cancelTokens['product'] = CancelToken();
    try {
      emit(state.copyWith(isloading: true, productFailureOrSuccess: none()));

      Either<AppFailure, Map<String, dynamic>> productFailureOrSuccess =
          await _iProductFacade.getProduct(
              productId: event.productId,
              cancelToken: _cancelTokens['product']);

      emit(
        state.copyWith(
          isloading: false,
          productFailureOrSuccess: optionOf(productFailureOrSuccess),
        ),
      );
    } finally {
      _cancelTokens.remove('product');
    }
  }

  FutureOr<void> _onGetProducts(
      _GetProducts event, Emitter<ProductsState> emit) async {
    _cancelTokens['products']?.cancel();
    _cancelTokens['products'] = CancelToken();
    try {
      emit(
        state.copyWith(
          isloading: true,
          products: [],
          productListFailureOrSuccess: none(),
        ),
      );

      Either<AppFailure, List<Product>> productListFailureOrSuccess =
          await _iProductFacade.getProducts(
        all: event.all,
        searchTerm: event.searchTerm,
        engineerId: event.engineerId,
        cancelToken: _cancelTokens['products'],
      );

      emit(
        state.copyWith(
          isloading: false,
          searchTerm: event.searchTerm,
          products: productListFailureOrSuccess.fold((l) => [], (r) => r),
          productListFailureOrSuccess: optionOf(productListFailureOrSuccess),
        ),
      );
    } finally {
      _cancelTokens.remove('products');
    }
  }

  FutureOr<void> _onGetAllProducts(
      _GetAllProducts event, Emitter<ProductsState> emit) async {
    _cancelTokens['all_products']?.cancel();
    _cancelTokens['all_products'] = CancelToken();
    try {
      emit(
        state.copyWith(
          isloading: true,
          allProducts: [],
          allProductListFailureOrSuccess: none(),
        ),
      );

      Either<AppFailure, List<Product>> productListFailureOrSuccess =
          await _iProductFacade.getProducts(
        all: true,
        cancelToken: _cancelTokens['all_products'],
      );

      emit(
        state.copyWith(
          isloading: false,
          allProducts: productListFailureOrSuccess.fold((l) => [], (r) => r),
          allProductListFailureOrSuccess: optionOf(productListFailureOrSuccess),
        ),
      );
    } finally {
      _cancelTokens.remove('all_products');
    }
  }
}
