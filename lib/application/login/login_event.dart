part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onSubmit({
    required String email,
    required String password,
  }) = _OnSubmit;
}
