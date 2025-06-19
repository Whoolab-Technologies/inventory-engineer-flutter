import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/materal_return/i_material_return_facade.dart';
import 'package:mvp_engineer/domain/models/material_return/material_return.dart';
import 'package:mvp_engineer/domain/models/material_return/material_return_response.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@LazySingleton(as: IMaterialReturnFacade)
class MaterialReturnRepo extends IMaterialReturnFacade {
  final DioClient _client;
  MaterialReturnRepo(this._client);
  @override
  Future<Either<AppFailure, MaterialReturn>> createMaterialReturn(
      Map<String, dynamic> request) async {
    try {
      Response response = await _client.dio.post(
        Api.endPoints["material-returns"]!,
        data: request,
      );
      MaterialReturnPostResponse materialReturnResponse =
          MaterialReturnPostResponse.fromJson(response.data);
      if (materialReturnResponse.error) {
        return left(
            AppFailure.customError(message: materialReturnResponse.message));
      }
      return right(materialReturnResponse.data!);
    } on DioException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      return left(AppFailure.customError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<MaterialReturn>>> getMaterialReturnList(
      {CancelToken? cancelToken}) async {
    try {
      Response response = await _client.dio.get(
        Api.endPoints["material-returns"]!,
        cancelToken: cancelToken,
      );
      MaterialReturnResponse materialReturnResponse =
          MaterialReturnResponse.fromJson(response.data);
      if (materialReturnResponse.error) {
        return left(
            AppFailure.customError(message: materialReturnResponse.message));
      }
      return right(materialReturnResponse.data ?? []);
    } on DioException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      return left(AppFailure.customError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<Product>>> getProductsList(
      {CancelToken? cancelToken}) async {
    try {
      Response response = await _client.dio.get(
        "${Api.endPoints["material-returns"]}/${Api.endPoints["products"]}",
      );
      MaterialReturnProductResponse materialReturnResponse =
          MaterialReturnProductResponse.fromJson(response.data);
      if (materialReturnResponse.error) {
        return left(
            AppFailure.customError(message: materialReturnResponse.message));
      }
      log("${materialReturnResponse.data?.length}");
      return right(materialReturnResponse.data!);
    } on DioException catch (e) {
      log("DioException ${e}");
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      log("PlatformException ${e.message}");

      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      log("ca ${e}");
      return left(AppFailure.customError(message: e.toString()));
    }
  }
}
