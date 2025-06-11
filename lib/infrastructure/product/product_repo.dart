import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/models/engineer/engineer.dart';
import 'package:mvp_engineer/domain/models/product/product.dart';
import 'package:mvp_engineer/domain/models/product_response/product_response.dart';
import 'package:mvp_engineer/domain/models/store/store.dart';
import 'package:mvp_engineer/domain/product/i_product_facade.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@LazySingleton(as: IProductFacade)
class ProductRepo implements IProductFacade {
  final DioClient _client;
  ProductRepo(this._client);

  @override
  Future<Either<AppFailure, List<Product>>> getProducts({
    bool? all,
    String? searchTerm,
    String? engineerId,
    CancelToken? cancelToken,
  }) async {
    try {
      Map<String, dynamic> queryParams = <String, dynamic>{};
      if (all != null) {
        queryParams.putIfAbsent("all", () => all);
      }
      if (searchTerm != null && searchTerm.isNotEmpty) {
        queryParams.putIfAbsent("search", () => searchTerm);
      }
      if (engineerId != null && engineerId.isNotEmpty) {
        queryParams.putIfAbsent("engineer_id", () => engineerId);
      }
      Response response = await _client.dio.get(
        Api.endPoints["products"]!,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      if (!productResponse.error) {
        List<Product> products = (productResponse.data ?? [])
            .map<Product>((el) => Product.fromJson(el))
            .toList();
        return right(products);
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

  @override
  Future<Either<AppFailure, Map<String, dynamic>>> getProduct({
    required String productId,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _client.dio.get(
        '${Api.endPoints["products"]!}/$productId',
        cancelToken: cancelToken,
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

  @override
  Future<Either<AppFailure, Map<String, dynamic>>> getStoresAndEngineer(
      {CancelToken? cancelToken}) async {
    try {
      List<Store> stores = [];
      List<Engineer> engineers = [];
      Response response = await _client.dio
          .get(Api.endPoints["stores_engineers"]!, cancelToken: cancelToken);
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      if (!productResponse.error) {
        if (productResponse.data != null) {
          final data = productResponse.data;
          stores = (data['stores'] ?? [])
              .map<Store>((el) => Store.fromJson(el))
              .toList();
          engineers = (data['engineers'] ?? [])
              .map<Engineer>((el) => Engineer.fromJson(el))
              .toList();
        }
        Map<String, dynamic> responseData = {
          "engineers": engineers,
          "stores": stores
        };
        return right(responseData);
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
