import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/material_request/i_material_request_facade.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/domain/models/material_request_response/material_request_create_response.dart';
import 'package:mvp_engineer/domain/models/material_request_response/material_request_list_response.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/domain/models/product_response/product_response.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@LazySingleton(as: IMaterialRequestFacade)
class MaterialRequestRepo implements IMaterialRequestFacade {
  final DioClient _client;
  MaterialRequestRepo(this._client);

  @override
  Future<Either<AppFailure, List<MaterialRequest>>> fetchMaterialRequests(
      {CancelToken? cancelToken}) async {
    try {
      Response response = await _client.dio.get(
        Api.endPoints["mr"]!,
        cancelToken: cancelToken,
      );
      MaterialRequestListResponse materialRequestListResponse =
          MaterialRequestListResponse.fromJson(response.data);
      if (!materialRequestListResponse.error) {
        return right(materialRequestListResponse.data!);
      } else {
        return left(
          AppFailure.customError(message: materialRequestListResponse.message),
        );
      }
    } on DioException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      return left(AppFailure.customError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, MaterialRequest>> postMaterialRequests(
      List<MaterialRequestItem> mr,
      List<Map<String, dynamic>>? selectedFiles) async {
    try {
      List<Map<String, dynamic>> mrItems = mr
          .map((el) => {"product_id": el.productId, "quantity": el.quantity})
          .toList();

      FormData formData = FormData();

      List<Map<String, dynamic>> _selectedFiles =
          List<Map<String, dynamic>>.from(selectedFiles ?? []);
      for (int i = 0; i < _selectedFiles.length; i++) {
        final file = _selectedFiles[i]['file'];
        if (file != null) {
          formData.files.add(
            MapEntry(
              'files[]',
              await MultipartFile.fromFile(
                file.path,
                filename: file.path.split('/').last,
              ),
            ),
          );
        }
      }

      formData.fields.add(MapEntry("items", jsonEncode(mrItems)));

      Response response = await _client.dio.post(
        Api.endPoints["mr"]!,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      );
      MaterialRequestCreateResponse mrCreateResponse =
          MaterialRequestCreateResponse.fromJson(response.data);
      if (!mrCreateResponse.error) {
        return right(mrCreateResponse.data!);
      } else {
        return left(
          AppFailure.customError(message: mrCreateResponse.message),
        );
      }
    } on DioException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      return left(AppFailure.customError(message: e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<Product>>> getProducts(
      {String? searchTerm, CancelToken? cancelToken}) async {
    try {
      Map<String, dynamic> queryParameters = {};
      if (searchTerm != null && searchTerm.isNotEmpty) {
        queryParameters.putIfAbsent("search", () => searchTerm);
      }
      List<Product> products = [];
      Response response = await _client.dio.get(
        Api.endPoints["materials"]!,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      ProductResponse productsResponse =
          ProductResponse.fromJson(response.data);
      if (productsResponse.error) {
        return left(
          AppFailure.customError(message: productsResponse.message),
        );
      }
      products = (productsResponse.data ?? [])
          .map<Product>((el) => Product.fromJson(el))
          .toList();
      return right(products);
    } on DioException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      return left(AppFailure.customError(message: e.toString()));
    }
  }
}
