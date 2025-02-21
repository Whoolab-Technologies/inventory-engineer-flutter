import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/store/i_store_facade.dart';
import 'package:mvp_engineer/domain/store/model/store/store.dart';
import 'package:mvp_engineer/domain/store/model/store/store_response.dart';

import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@LazySingleton(as: IStoreFacade)
class StoreRepo implements IStoreFacade {
  final DioClient _client = DioClient.instance;
  StoreRepo();

  @override
  Future<Either<AppFailure, List<Store>>> getProducts() async {
    try {
      Response response = await _client.dio.get(Api.endPoints["products"]!);
      StoreResponse storeResponse = StoreResponse.fromJson(response.data);
      if (!storeResponse.error) {
        return right(storeResponse.data!);
      } else {
        return left(
          AppFailure.customError(message: storeResponse.message),
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
