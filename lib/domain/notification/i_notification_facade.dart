import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class INotificationFacade {
  Future<Either<AppFailure, Unit>> initializeFcm();
  Future<Either<AppFailure, Unit>> removeToken();
}
