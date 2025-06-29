import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/notification/i_notification_facade.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final INotificationFacade _iNotificationFacade;
  NotificationBloc(this._iNotificationFacade)
      : super(const NotificationState.initial()) {
    on<_Started>((event, emit) async {
      final result = await _iNotificationFacade.initializeFcm();
      result.fold(
        (failure) =>
            emit(NotificationState.fcmInitializationError(failure.message)),
        (_) => emit(const NotificationState.fcmInitialized()),
      );
    });

    on<_OnRemoveToken>((event, emit) async {
      final result = await _iNotificationFacade.removeToken();
      result.fold(
        (failure) => emit(NotificationState.removeTokenError(failure.message)),
        (_) => emit(const NotificationState.tokenRemoved()),
      );
    });
  }
}
