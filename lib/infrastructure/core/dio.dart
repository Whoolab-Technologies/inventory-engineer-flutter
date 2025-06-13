import "dart:convert";
import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:mvp_engineer/core/utils/utils.dart";
import "package:mvp_engineer/core/values/api.dart";
import "package:mvp_engineer/global.dart";
import "package:mvp_shared_components/core/services/storage.dart";

import "base_response/base_response.dart";

class DioClient {
  DioClient._(); // private constructor

  static final DioClient _instance =
      DioClient._(); // single instance of DioClient

  static DioClient get instance => _instance; // getter to access the instance

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
    if (!_isInterceptorsSetup) {
      _dio.options = BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      );
      setupInterceptors();
      _isInterceptorsSetup = true;
    }
    return _dio;
  }

  void setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        await Future.delayed(const Duration(milliseconds: 300));
        options.headers['Accept'] = 'application/json';

        // Handle password endpoint URL modification
        String path = options.path;
        String baseUrl = options.baseUrl;
        final isPasswordEndpoint = path.contains('password/reset') ||
            path.contains('password/confirm');
        if (isPasswordEndpoint && baseUrl.contains('/v1/engineer')) {
          baseUrl = baseUrl.replaceFirst('/v1/engineer', '/v1');
          options.baseUrl = baseUrl;
        }

        final shouldExclude = excludedEndpoints
            .any((endpoint) => options.path.contains(endpoint));
        if (!shouldExclude) {
          if (_token.isEmpty) {
            await getToken();
          }
          options.headers["Authorization"] = "Bearer $_token";
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.type == DioExceptionType.cancel) {
          return handler.next(e); // Let Dio handle it as a cancellation
        }
        // Decode Uint8List response if needed
        if (e.response?.data is Uint8List) {
          String jsonString = utf8.decode(e.response!.data);
          e.response?.data = json.decode(jsonString);
        }
        String errorMessage = "Something went wrong. Please try again.";
        int retryCount = 0;
        const int maxRetries = 2;

        // Retry logic for connection timeout and send timeout
        while (retryCount < maxRetries) {
          if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.sendTimeout) {
            retryCount++;
            try {
              // Retry the request
              final response = await _dio.fetch(e.requestOptions);
              return handler.resolve(response);
            } catch (retryError) {
              // If the retry fails, update the error and continue
              e = retryError as DioException;
              continue; // Retry again
            }
          } else {
            break; // Exit the retry loop if the error is not a timeout
          }
        }

        switch (e.type) {
          case DioExceptionType.connectionTimeout:
            errorMessage = "Connection timeout. Please check your internet.";
            break;
          case DioExceptionType.sendTimeout:
            errorMessage = "Send timeout. Server is not reachable.";
            break;
          case DioExceptionType.receiveTimeout:
            errorMessage = "Server took too long to respond. Please try again.";
            break;
          case DioExceptionType.badCertificate:
            errorMessage = "SSL Certificate error.";
            break;
          case DioExceptionType.connectionError:
            errorMessage = "Connection error. Please check your network.";
            break;
          case DioExceptionType.cancel:
            errorMessage = "Request was cancelled.";
            break;
          case DioExceptionType.badResponse:
            if (e.response?.data != null) {
              try {
                errorMessage = BaseResponse.fromJson(e.response!.data).message;
              } catch (_) {
                errorMessage = "Invalid response format.";
              }
            }
            break;
          case DioExceptionType.unknown:
          default:
            errorMessage = "Unknown error occurred.";
            break;
        }

        final exception = DioException(
          type: e.type,
          message: errorMessage,
          requestOptions: e.requestOptions,
          response: e.response,
        );

        // Handle Unauthorized (401)
        if (e.response?.statusCode == 401) {
          final shouldExclude = excludedEndpoints
              .any((endpoint) => e.requestOptions.path.contains(endpoint));
          if (!shouldExclude) {
            await AppGlobal.storageService.clearAll();
            Utils.onServerLogOut(exception.message ?? "Session expired.");
          }
        }
        return handler.next(exception);
      },
    ));
  }
}
