import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter/services.dart";

import "package:dartz/dartz.dart";
import "package:injectable/injectable.dart";
import "package:mvp_engineer/core/services/storage.dart";
import "package:mvp_engineer/core/values/api.dart";
import "package:mvp_engineer/core/values/strings.dart";
import "package:mvp_engineer/domain/app-data/app_data.dart";
import "package:mvp_engineer/domain/auth/auth_failures.dart";
import "package:mvp_engineer/domain/auth/auth_value_objects.dart";
import "package:mvp_engineer/domain/auth/i_auth_facade.dart";
import "package:mvp_engineer/domain/auth/model/user/user.dart";
import "package:mvp_engineer/domain/auth/model/user_response/user_response.dart";
import "package:mvp_engineer/global.dart";
import "package:mvp_engineer/infrastructure/core/base_response/base_response.dart";
import "package:mvp_engineer/infrastructure/core/dio.dart";
import "package:mvp_engineer/injection/errors.dart";

@LazySingleton(as: IAuthFacade)
class AuthRepo implements IAuthFacade {
  final DioClient _client = DioClient.instance;
  final AppData _appData;

  final StorageService _storage = AppGlobal.storageService;
  AuthRepo(
    this._appData,
  );

  @override
  Future<Either<AuthFailures, User>> registerWithEmailAndPassword(
      {required Name firstName,
      required Name lastName,
      required EmailAddress emailAddress,
      required Password password}) async {
    final firstNameString =
        firstName.value.fold((l) => throw UnExpectedValueError(l), id);
    final lastNameString = lastName.value.fold((l) => "", id);

    final emailAddressString =
        emailAddress.value.fold((l) => throw UnExpectedValueError(l), id);
    final passwordString =
        password.value.fold((l) => throw UnExpectedValueError(l), id);
    try {
      Map<String, dynamic> data = {
        "email": emailAddressString,
        "password": passwordString,
        "first_name": firstNameString,
        "last_name": lastNameString,
        "confirmPassword": passwordString,
      };
      Response response =
          await _client.dio.post(Api.endPoints["register"]!, data: data);
      UserResponse userResponse = UserResponse.fromJson(response.data);

      if (!userResponse.error) {
        User? user = userResponse.data;
        setUser(user);
        return right(userResponse.data!);
      } else {
        return left(
          AuthFailures.serverError(message: userResponse.message),
        );
      }
    } on DioException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } catch (e) {
      return left(AuthFailures.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailures, User>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      Map<String, dynamic> data = {
        "email": email,
        "password": password,
      };

      Response response =
          await _client.dio.post(Api.endPoints["login"]!, data: data);
      UserResponse userResponse = UserResponse.fromJson(response.data);
      if (!userResponse.error) {
        User? user = userResponse.data;
        await setUser(user);
        return right(user!);
      } else {
        return left(
          AuthFailures.serverError(message: userResponse.message),
        );
      }
    } on DioException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } catch (e) {
      return left(AuthFailures.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailures, Unit>> signOut() async {
    try {
      Response response = await _client.dio.post(Api.endPoints["logout"]!);
      BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if (!baseResponse.error) {
        await clearUser();
        return right(unit);
      } else {
        return left(
          AuthFailures.serverError(message: baseResponse.message),
        );
      }
    } on DioException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } catch (e) {
      return left(AuthFailures.serverError(message: e.toString()));
    }
  }

  @override
  Future<Option<User>> getSignedInUser() async {
    final storedUser = await _storage.read(
      key: "user",
    );
    User? user;
    if (storedUser != null) {
      user = User.decode(storedUser);
      AppData.setUser(user);
    }
    return optionOf(AppData.engineer);
  }

  @override
  Future<void> forcedSignOut() async {
    await clearUser();
  }

  setUser(User? user) async {
    try {
      await _storage.writeString(key: "user", value: user!.encode());
      await _storage.writeString(key: "token", value: user.token);
    } catch (_) {}
    _client.token = user!.token!;
    _appData.user = user;
  }

  Future<void> clearUser() async {
    _appData.user = null;
    await _storage.clearAll();
  }

  @override
  Future<Either<AuthFailures, Unit>> sendPasswordResetRequest(
      {required EmailAddress emailAddress}) async {
    try {
      final emailAddressString =
          emailAddress.value.fold((l) => throw UnExpectedValueError(l), id);

      Map<String, dynamic> data = {
        "email": emailAddressString,
      };

      Response response =
          await _client.dio.post(Api.endPoints["sendLink"]!, data: data);
      BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if (!baseResponse.error) {
        return right(unit);
      } else {
        return left(
          AuthFailures.serverError(message: baseResponse.message),
        );
      }
    } on DioException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } catch (e) {
      return left(AuthFailures.serverError(message: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailures, Unit>> sendCodeVerificationRequest({
    required EmailAddress emailAddress,
    required VerificationCode code,
    required Password password,
  }) async {
    try {
      final emailAddressString =
          emailAddress.value.fold((l) => throw UnExpectedValueError(l), id);
      final codeString =
          code.value.fold((l) => throw UnExpectedValueError(l), id);
      final passwordString =
          password.value.fold((l) => throw UnExpectedValueError(l), id);

      Map<String, dynamic> data = {
        "email": emailAddressString,
        "code": codeString,
        "password": passwordString
      };

      Response response =
          await _client.dio.post(Api.endPoints["reset"]!, data: data);
      BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if (!baseResponse.error) {
        return right(unit);
      } else {
        return left(
          AuthFailures.serverError(message: baseResponse.message),
        );
      }
    } on DioException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } on UnExpectedValueError catch (e) {
      return left(AuthFailures.serverError(
          message: e.valueFailure.maybeMap(
        orElse: () => "Invalid Parameters",
        invalidEmailAddress: (_) => Strings.invalidEmail,
        empty: (_) => "Email/Password ${Strings.empty}",
        noUpperCase: (_) => Strings.noUpperCase,
        shortPassword: (_) => Strings.shortPassword,
        noNumber: (_) => Strings.noNumber,
        noSpecialSymbol: (_) => Strings.noSpecialSymbol,
      )));
    } on PlatformException catch (e) {
      return left(AuthFailures.serverError(message: e.message!));
    } catch (e) {
      return left(AuthFailures.serverError(message: e.toString()));
    }
  }
}
