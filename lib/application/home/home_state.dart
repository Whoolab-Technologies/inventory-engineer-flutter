part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isloading,
    required Option<Either<AppFailure, HomeData>> homeDataFailuresOrSuccess,
  }) = _HomeState;
  factory HomeState.initial() => HomeState(
        isloading: false,
        homeDataFailuresOrSuccess: none(),
      );
}
