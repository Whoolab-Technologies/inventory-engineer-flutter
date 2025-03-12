import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/domain/models/transfer/transfer.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class ITransferFacade {
  Future<Either<AppFailure, List<Transfer>>> getTransfers();
}
