import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/home/i_home_facade.dart';
import 'package:mvp_engineer/domain/models/home/home_data.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeFacade _iHomeFacade;
  HomeBloc(this._iHomeFacade) : super(HomeState.initial()) {
    on<_FetchData>((event, emit) async {
      emit(
        state.copyWith(
          isloading: true,
          homeDataFailuresOrSuccess: none(),
        ),
      );
      Either<AppFailure, HomeData> homeDataFailuresOrSuccess =
          await _iHomeFacade.fetchData();
      homeDataFailuresOrSuccess.fold(
        (failure) {
          log('Fetch data failed: $failure');
          return null;
        },
        (data) {
          log('Fetch data succeeded: $data');
          return null;
        },
      );

      emit(
        state.copyWith(
          isloading: false,
          homeDataFailuresOrSuccess: optionOf(homeDataFailuresOrSuccess),
        ),
      );
    });
  }
}
