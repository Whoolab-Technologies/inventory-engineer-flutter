import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IMaterialRequestFacade {
  Future<Either<AppFailure, List<MaterialRequest>>> fetchMaterialRequests(
      {CancelToken? cancelToken});
  Future<Either<AppFailure, List<Product>>> getProducts(
      {String? searchTerm, CancelToken? cancelToken});
  Future<Either<AppFailure, List<Product>>> getProduct(
      {required String id, CancelToken? cancelToken});
  Future<Either<AppFailure, MaterialRequest>> postMaterialRequests(
      List<MaterialRequestItem> mr, List<Map<String, dynamic>>? selectedFiles);
}
