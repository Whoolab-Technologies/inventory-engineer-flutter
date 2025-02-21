part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required Option<Either<AuthFailures, User>> loginFailureOrSuccess,
  }) = _LoginState;
  factory LoginState.initial() => LoginState(
        isLoading: false,
        loginFailureOrSuccess: none(),
      );
}
