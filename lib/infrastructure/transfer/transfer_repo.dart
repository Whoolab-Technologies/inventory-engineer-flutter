import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/core/values/api.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer_response/transfer_response.dart';
import 'package:mvp_engineer/domain/transfer/i_transfer_facade.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@LazySingleton(as: ITransferFacade)
class TransferRepo implements ITransferFacade {
  final DioClient _dioClient;
  TransferRepo(this._dioClient);
  @override
  Future<Either<AppFailure, List<Transfer>>> getTransfers() async {
    try {
      final Response response =
          await _dioClient.dio.get(Api.endPoints["transfers"]!);
      TransferResponse transferResponse =
          TransferResponse.fromJson(response.data);
      if (transferResponse.error) {
        return left(AppFailure.customError(message: transferResponse.message));
      }
      return right(transferResponse.data!);
    } on DioException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } on PlatformException catch (e) {
      return left(AppFailure.customError(message: e.message!));
    } catch (e) {
      return left(AppFailure.customError(message: e.toString()));
    }
  }
}
