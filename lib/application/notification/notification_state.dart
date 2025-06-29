part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = Initial;
  const factory NotificationState.fcmInitialized() = OnFcmInitialized;
  const factory NotificationState.tokenRemoved() = OnTokenRemoved;
  const factory NotificationState.fcmInitializationError(String message) =
      OnFcmInitializationError;
  const factory NotificationState.removeTokenError(String message) =
      OnRemoveTokenError;
}
