import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/domain/auth/auth_failures.dart';
import 'package:mvp_engineer/domain/auth/auth_value_objects.dart';
import 'package:mvp_engineer/domain/auth/model/user/user.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailures, User>> registerWithEmailAndPassword({
    required Name firstName,
    required Name lastName,
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailures, User>> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<Option<User>> getSignedInUser();

  Future<Either<AuthFailures, Unit>> signOut();
  Future<void> forcedSignOut();

  Future<Either<AuthFailures, Unit>> sendPasswordResetRequest(
      {required EmailAddress emailAddress});
  Future<Either<AuthFailures, Unit>> sendCodeVerificationRequest({
    required EmailAddress emailAddress,
    required VerificationCode code,
    required Password password,
  });
}
