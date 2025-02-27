import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/app-data/app_data.dart';
import 'package:mvp_engineer/domain/auth/i_auth_facade.dart';
import 'package:mvp_engineer/global.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _iAuthRepo;
  AuthBloc(this._iAuthRepo) : super(const AuthState.authInitial()) {
    on<AuthCheckRequested>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 3000), () async {
        try {
          final userOption = await _iAuthRepo.getSignedInUser();

          emit(
            userOption.fold(
              () => const AuthState.unauthenticated(),
              (_) => const AuthState.authenticated(),
            ),
          );
        } catch (e) {
          if (kDebugMode) {
            print("$e");
          }
          add(const SignedOut());
          emit(const AuthState.unauthenticated());
        }
      });
    });
    on<SignedOut>((event, emit) async {
      // await _iPushNotificationRepository.removeFcmToken();
      // await _iAuthRepo.signOut();
      await AppGlobal.storageService.clearAll();
      AppData.clear();
      emit(const AuthState.unauthenticated());
    });
    on<ForcedSignedOut>((event, emit) async {
      //  await _iPushNotificationRepository.removeFcmToken(forced: true);
      await _iAuthRepo.signOut();
      await AppGlobal.storageService.clearAll();
      emit(const AuthState.unauthenticated());
    });
  }
}
