import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/auth/auth_failures.dart';
import 'package:mvp_engineer/domain/auth/i_auth_facade.dart';

part 'password_reset_event.dart';
part 'password_reset_state.dart';
part 'password_reset_bloc.freezed.dart';

@injectable
class PasswordResetBloc extends Bloc<PasswordResetEvent, PasswordResetState> {
  final IAuthFacade _iAuthFacade;
  PasswordResetBloc(this._iAuthFacade) : super(PasswordResetState.initial()) {
    on<_OnSubmit>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, passwordRestLinkFailuresOrSuccess: none()));
      Either<AuthFailures, Unit> result =
          await _iAuthFacade.sendPasswordResetRequest(email: event.email);
      emit(
        state.copyWith(
          isLoading: false,
          passwordRestLinkFailuresOrSuccess: optionOf(result),
        ),
      );
    });
  }
}
