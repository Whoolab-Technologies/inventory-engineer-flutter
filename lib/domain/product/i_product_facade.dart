import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IProductFacade {
  Future<Either<AppFailure, List<Product>>> getProducts({String? searchTerm});
}
