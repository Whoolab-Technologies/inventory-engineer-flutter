import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/domain/store/model/store/store.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IStoreFacade {
  Future<Either<AppFailure, List<Store>>> getProducts();
}
