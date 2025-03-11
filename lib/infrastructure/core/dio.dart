import "dart:convert";
import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:mvp_engineer/core/utils/utils.dart";
import "package:mvp_engineer/global.dart";
import "package:mvp_engineer/core/values/api.dart";

import "base_response/base_response.dart";
import 'package:mvp_shared_components/core/services/storage.dart';

class DioClient {
  DioClient._();

  static final DioClient _instance = DioClient._();

  static DioClient get instance => _instance;

  final Dio _dio = Dio();
  final StorageService storage = AppGlobal.storageService;

  final String _baseUrl = kDebugMode ? Api.baseUrlDev : Api.baseUrl;
  String _token = "";
  bool _isInterceptorsSetup = false;
  final excludedEndpoints = ["/login", "/resetpassword", "/register"];

  Future<String> getToken() async {
    _token = await storage.read(
          key: "token",
        ) ??
        "";
    return _token;
  }

  set token(String token) {
    _token = token;
  }

  Dio get dio {
    // if (_baseUrl.isEmpty) {
    //   setBaseUrl();
    // }
    if (!_isInterceptorsSetup) {
      _dio.options.baseUrl = _baseUrl;
      setupInterceptors();
      _isInterceptorsSetup = true;
    }
    return _dio;
  }

  void setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final shouldExclude = excludedEndpoints
            .any((endpoint) => options.path.contains(endpoint));
        if (!shouldExclude) {
          if (_token.isEmpty) {
            await getToken();
          }
          options.headers["Authorization"] = "Bearer $_token";
        }
        options.headers['Accept'] = 'application/json';
        log("MVP ${options.uri}");
        log("MVP token => $_token");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response?.data is Uint8List) {
          String jsonString = utf8.decode(e.response?.data);
          e.response?.data = json.decode(jsonString);
        }
        final exception = DioException(
          type: e.type,
          message: BaseResponse.fromJson(e.response?.data).message,
          requestOptions: e.requestOptions,
        );

        if (e.response?.statusCode == 401) {
          final shouldExclude = excludedEndpoints
              .any((endpoint) => e.requestOptions.path.contains(endpoint));
          if (!shouldExclude) {
            Utils.onServerLogOut(exception.message ?? "Something went wrong.");
          }
        }
        return handler.next(exception);
      },
    ));
  }
}
