import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/notification/i_notification_facade.dart';
import 'package:mvp_engineer/global.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/base_response/base_response.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';
import 'package:mvp_shared_components/core/services/notification_service.dart';

@LazySingleton(as: INotificationFacade)
class NotificationRepo implements INotificationFacade {
  final NotificationService _notificationService;
  final DioClient _dioClient;
  NotificationRepo(this._notificationService, this._dioClient);
  @override
  Future<Either<AppFailure, Unit>> initializeFcm() async {
    try {
      final String? token = await _notificationService.initialize();

      if (token == null || token.isEmpty) {
        return left(const AppFailure.customError(
            message: "Failed to retrieve FCM token."));
      }
      await AppGlobal.storageService.writeString(key: token, value: token);
      final deviceInfo = DeviceInfoPlugin();
      String deviceModel = '';
      String deviceBrand = '';
      String osVersion = '';
      String platform = '';
      String deviceId = '';

      String sdkInt = '';

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.id;
        deviceModel = androidInfo.model;
        deviceBrand = androidInfo.brand;
        sdkInt = "SDK ${androidInfo.version.sdkInt}";
        osVersion = 'Android ${androidInfo.version.release}';
        platform = 'android';
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? "";
        deviceModel = iosInfo.utsname.machine;
        deviceBrand = iosInfo.name;
        osVersion = 'iOS ${iosInfo.systemVersion}';
        platform = 'ios';
      }

      final data = {
        'fcm_token': token,
        'device_model': deviceModel,
        'device_brand': deviceBrand,
        'os_version': osVersion,
        'platform': platform,
        'device_id': deviceId,
        'sdk': sdkInt,
      };

      final Response response = await _dioClient.dio.post(
        Api.endPoints["fcm"]!,
        data: data,
      );

      if (response.statusCode == 200) {
        return right(unit);
      } else {
        return left(AppFailure.customError(
            message:
                "Failed to send token to server. Status: ${response.statusCode}"));
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
  Future<Either<AppFailure, Unit>> removeToken() async {
    try {
      String? token = await AppGlobal.storageService.read(key: 'token');
      final Response response =
          await _dioClient.dio.delete(Api.endPoints["fcm"]!, data: {token});

      BaseResponse baseResponse = BaseResponse.fromJson(response.data);
      if (baseResponse.error) {
        return left(AppFailure.customError(message: baseResponse.message));
      }
      return right(unit);
    } on DioException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      return left(AppFailure.customError(message: e.toString()));
    }
  }
}
