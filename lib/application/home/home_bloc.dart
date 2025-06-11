import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/home/i_home_facade.dart';
import 'package:mvp_engineer/domain/models/home/home_data.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeFacade _iHomeFacade;
  final Map<String, CancelToken> _cancelTokens = {};
  HomeBloc(this._iHomeFacade) : super(HomeState.initial()) {
    on<_FetchData>(_onFetchData, transformer: restartable());
  }

  Future<void> _onFetchData(_FetchData event, Emitter<HomeState> emit) async {
    try {
      _cancelTokens['home']?.cancel();
      _cancelTokens['home'] = CancelToken();
      emit(
        state.copyWith(
          isloading: true,
          homeDataFailuresOrSuccess: none(),
        ),
      );
      Either<AppFailure, HomeData> homeDataFailuresOrSuccess =
          await _iHomeFacade.fetchData(cancelToken: _cancelTokens['home']);

      emit(
        state.copyWith(
          isloading: false,
          homeDataFailuresOrSuccess: optionOf(homeDataFailuresOrSuccess),
        ),
      );
    } finally {
      _cancelTokens.remove('home');
    }
  }
}
