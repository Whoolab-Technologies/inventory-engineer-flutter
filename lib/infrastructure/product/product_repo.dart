import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/domain/models/product_response/product_response.dart';
import 'package:mvp_engineer/domain/product/i_product_facade.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@LazySingleton(as: IProductFacade)
class ProductRepo implements IProductFacade {
  final DioClient _client;
  ProductRepo(this._client);

  @override
  Future<Either<AppFailure, List<Product>>> getProducts(
      {String? searchTerm}) async {
    try {
      Map<String, dynamic> queryParams = <String, dynamic>{};
      if (searchTerm != null && searchTerm.isNotEmpty) {
        queryParams.putIfAbsent("search", () => searchTerm);
      }
      Response response = await _client.dio.get(
        Api.endPoints["products"]!,
        queryParameters: queryParams,
      );
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      if (!productResponse.error) {
        return right(productResponse.data!);
      } else {
        return left(
          AppFailure.customError(message: productResponse.message),
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
}
