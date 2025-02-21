import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/auth/auth_failures.dart';
import 'package:mvp_engineer/domain/auth/i_auth_facade.dart';
import 'package:mvp_engineer/domain/auth/model/user/user.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthFacade iAuthFacade;
  LoginBloc(this.iAuthFacade) : super(LoginState.initial()) {
    on<_OnSubmit>((event, emit) async {
      emit(state.copyWith(isLoading: true, loginFailureOrSuccess: none()));
      final Either<AuthFailures, User> loginFailureOrSuccess =
          await iAuthFacade.signInWithEmailAndPassword(
              email: event.email, password: event.password);
      emit(
        state.copyWith(
          isLoading: false,
          loginFailureOrSuccess: optionOf(loginFailureOrSuccess),
        ),
      );
    });
  }
}
