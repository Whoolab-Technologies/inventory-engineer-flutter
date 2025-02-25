import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/material_request/i_material_request_facade.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

@LazySingleton(as: IMaterialRequestFacade)
class MaterialRequestRepo implements IMaterialRequestFacade {
  List<MaterialRequest> dummyMaterialRequests = [
    MaterialRequest(
      id: "1",
      title: "Request A",
      description: "This is the first material request.",
      items: [
        MaterialRequestItem(productName: "Cement", quantity: 10, productId: ''),
        MaterialRequestItem(productName: "Bricks", quantity: 50, productId: ''),
      ],
      createdAt: DateTime.now(),
    ),
    MaterialRequest(
      id: "2",
      title: "Request B",
      description: "This is the second material request.",
      createdAt: DateTime.now(),
      items: [
        MaterialRequestItem(productName: "Sand", quantity: 30, productId: ''),
        MaterialRequestItem(
            productName: "Steel Rods", quantity: 20, productId: ''),
      ],
    ),
    MaterialRequest(
      id: "3",
      title: "Request C",
      description: "Urgent request for electrical wiring.",
      items: [
        MaterialRequestItem(
            productName: "Copper Wire", quantity: 100, productId: ''),
        MaterialRequestItem(
            productName: "Light Fixtures", quantity: 20, productId: ''),
      ],
      createdAt: DateTime.now(),
    ),
  ];

  @override
  Future<Either<AppFailure, List<MaterialRequest>>>
      fetchMaterialRequests() async {
    await Future.delayed(const Duration(seconds: 2));
    return right(dummyMaterialRequests);
  }
}
