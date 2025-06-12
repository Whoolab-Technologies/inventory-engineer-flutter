part of 'password_reset_bloc.dart';

@freezed
class PasswordResetEvent with _$PasswordResetEvent {
  const factory PasswordResetEvent.started() = _Started;
  const factory PasswordResetEvent.onSubmit({required String email}) =
      _OnSubmit;
}
