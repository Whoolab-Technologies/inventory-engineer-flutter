import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/home/i_home_facade.dart';
import 'package:mvp_engineer/domain/models/home/home_data.dart';
import 'package:mvp_engineer/domain/models/home/home_response.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@LazySingleton(as: IHomeFacade)
class HomeRepo implements IHomeFacade {
  final DioClient _dioClient;
  HomeRepo(this._dioClient);

  @override
  Future<Either<AppFailure, HomeData>> fetchData() async {
    try {
      Response response = await _dioClient.dio.get(
        Api.endPoints["home"]!,
      );
      HomeResponse homeResponse = HomeResponse.fromJson(response.data);
      if (!homeResponse.error) {
        return right(homeResponse.data);
      } else {
        return left(
          AppFailure.customError(message: homeResponse.message),
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
