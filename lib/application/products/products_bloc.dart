import 'dart:async';
import 'dart:developer';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
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
  ProductsBloc(this._iProductFacade) : super(ProductsState.state()) {
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

  FutureOr<void> _onGetStoresAndEngineers(
      _GetStoresAndEngineers event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(storesAndEngineersFailureOrSuccess: none()));

    Either<AppFailure, Map<String, dynamic>>
        storesAndEngineersFailureOrSuccess =
        await _iProductFacade.getStoresAndEngineer();
    log("storesAndEngineersFailureOrSuccess ${storesAndEngineersFailureOrSuccess}");
    emit(storesAndEngineersFailureOrSuccess
        .fold((_) => state.copyWith(stores: [], engineers: []), (data) {
      log("data['engineers'] ${(data['engineers'])}");
      return state.copyWith(
        stores: data['stores'] ?? [],
        engineers: data['engineers'] ?? [],
      );
    }));
  }

  FutureOr<void> _onGetProduct(event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(isloading: true, productFailureOrSuccess: none()));

    Either<AppFailure, Map<String, dynamic>> productFailureOrSuccess =
        await _iProductFacade.getProduct(productId: event.productId);

    emit(
      state.copyWith(
        isloading: false,
        productFailureOrSuccess: optionOf(productFailureOrSuccess),
      ),
    );
  }

  FutureOr<void> _onGetProducts(
      _GetProducts event, Emitter<ProductsState> emit) async {
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
    );

    emit(
      state.copyWith(
        isloading: false,
        searchTerm: event.searchTerm,
        products: productListFailureOrSuccess.fold((l) => [], (r) => r),
        productListFailureOrSuccess: optionOf(productListFailureOrSuccess),
      ),
    );
  }
}
