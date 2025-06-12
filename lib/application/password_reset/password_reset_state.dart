part of 'password_reset_bloc.dart';

@freezed
class PasswordResetState with _$PasswordResetState {
  const factory PasswordResetState({
    required bool isLoading,
    required Option<Either<AuthFailures, Unit>>
        passwordRestLinkFailuresOrSuccess,
  }) = _PasswordResetState;
  factory PasswordResetState.initial() => PasswordResetState(
        isLoading: true,
        passwordRestLinkFailuresOrSuccess: none(),
      );
}
