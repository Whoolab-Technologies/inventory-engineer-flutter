import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IProductFacade {
  Future<Either<AppFailure, List<Product>>> getProducts(
      {bool? all,
      String? searchTerm,
      String? engineerId,
      CancelToken? cancelToken});
  Future<Either<AppFailure, Map<String, dynamic>>> getStoresAndEngineer(
      {CancelToken? cancelToken});
  Future<Either<AppFailure, Map<String, dynamic>>> getProduct(
      {required String productId, CancelToken? cancelToken});
}
