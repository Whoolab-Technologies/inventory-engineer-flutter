part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = AuthCheckRequested;
  const factory AuthEvent.signedOut() = SignedOut;
  const factory AuthEvent.networkChanged() = NetworkChanged;
  const factory AuthEvent.forcedSignedOut() = ForcedSignedOut;
}
