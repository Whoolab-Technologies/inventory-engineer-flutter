import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/material_request/i_material_request_facade.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
import 'package:mvp_engineer/domain/models/material_request_item/material_request_item.dart';
import 'package:mvp_engineer/infrastructure/core/app_failure.dart';

part 'material_request_event.dart';
part 'material_request_state.dart';
part 'material_request_bloc.freezed.dart';

@injectable
class MaterialRequestBloc
    extends Bloc<MaterialRequestEvent, MaterialRequestState> {
  final IMaterialRequestFacade _iMaterialRequestRepo;
  MaterialRequestBloc(this._iMaterialRequestRepo)
      : super(MaterialRequestState.initial()) {
    on<FetchMaterialRequests>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, materialRequestsFailureOrSuccess: none()));
      final result = await _iMaterialRequestRepo.fetchMaterialRequests();
      emit(state.copyWith(
        isLoading: false,
        materialRequestsFailureOrSuccess: optionOf(result),
        materialRequests: result.fold((_) => [], (requests) => requests),
      ));
    });

    on<MaterialRequestProductAdded>((event, emit) {
      final updatedProducts = List<MaterialRequestItem>.from(state.mrItems)
        ..add(event.item);
      emit(state.copyWith(mrItems: updatedProducts));
    });

    on<MaterialRequestProductRemoved>((event, emit) {
      final updatedProducts = state.mrItems
          .where((p) => p.productId != event.item.productId)
          .toList();
      emit(state.copyWith(mrItems: updatedProducts));
    });

    on<MaterialRequestDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<MaterialRequestSubmitted>((event, emit) async {
      // Show loading state
      emit(state.copyWith(
        isLoading: true,
        materialRequestsFailureOrSuccess: none(),
        materialRequestsCreateFailureOrSuccess: none(),
      ));

      // Call repository
      final result =
          await _iMaterialRequestRepo.postMaterialRequests(state.mrItems);

      // Make a mutable copy of the materialRequests list
      final updatedMaterialRequests =
          List<MaterialRequest>.of(state.materialRequests);

      // Add new request if successful
      result.fold(
        (failure) => null,
        (newRequest) => updatedMaterialRequests.add(newRequest),
      );
      // Emit updated state
      emit(state.copyWith(
        isLoading: false,
        mrItems: result.isRight()
            ? []
            : state.mrItems, // Clear items only on success
        materialRequests: updatedMaterialRequests,
        materialRequestsFailureOrSuccess:
            optionOf(right(updatedMaterialRequests)),
        materialRequestsCreateFailureOrSuccess: optionOf(result),
      ));
    });
  }
}
