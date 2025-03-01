import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/domain/models/home/home_data.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IHomeFacade {
  Future<Either<AppFailure, HomeData>> fetchData();
}
