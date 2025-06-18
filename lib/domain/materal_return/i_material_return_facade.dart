import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvp_engineer/domain/models/material_return/material_return.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IMaterialReturnFacade {
  Future<Either<AppFailure, List<MaterialReturn>>> getMaterialReturnList(
      {CancelToken? cancelToken});
  Future<Either<AppFailure, List<Product>>> getProductsList(
      {CancelToken? cancelToken});
  Future<Either<AppFailure, MaterialReturn>> createMaterialReturn(
      Map<String, dynamic> request);
}
