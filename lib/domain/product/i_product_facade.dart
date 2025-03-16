import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IProductFacade {
  Future<Either<AppFailure, List<Product>>> getProducts(
      {String? searchTerm, String? engineerId});
  Future<Either<AppFailure, Map<String, dynamic>>> getStoresAndEngineer();
  Future<Either<AppFailure, Map<String, dynamic>>> getProduct({
    required String productId,
  });
}
