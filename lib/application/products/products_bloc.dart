import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/store/i_store_facade.dart';
import 'package:mvp_engineer/domain/store/model/store/store.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final IStoreFacade _iStoreFacade;
  ProductsBloc(this._iStoreFacade) : super(ProductsState.state()) {
    on<_GetProducts>((event, emit) async {
      emit(state.copyWith(isloading: true, stores: []));
      Either<AppFailure, List<Store>> storeListFailureOrSuccess =
          await _iStoreFacade.getProducts();

      emit(
        state.copyWith(
          isloading: false,
          stores: storeListFailureOrSuccess.fold((l) => [], (r) => r),
          storeListFailureOrSuccess: optionOf(storeListFailureOrSuccess),
        ),
      );
    });
  }
}
