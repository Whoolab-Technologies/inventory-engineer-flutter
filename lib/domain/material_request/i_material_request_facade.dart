import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

abstract class IMaterialRequestFacade {
  Future<Either<AppFailure, List<MaterialRequest>>> fetchMaterialRequests();
  Future<Either<AppFailure, MaterialRequest>> postMaterialRequests(
      List<MaterialRequestItem> mr);
}
