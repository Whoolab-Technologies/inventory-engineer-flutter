import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/material_request/i_material_request_facade.dart';
import 'package:mvp_engineer/domain/models/material_request/material_request.dart';
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
      final updatedProducts = List<Map<String, dynamic>>.from(state.mrItems)
        ..add({'product': event.product, 'quantity': event.quantity});
      emit(state.copyWith(mrItems: updatedProducts));
    });

    on<MaterialRequestProductRemoved>((event, emit) {
      final updatedProducts =
          state.mrItems.where((p) => p['product'] != event.product).toList();
      emit(state.copyWith(mrItems: updatedProducts));
    });

    on<MaterialRequestDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<MaterialRequestSubmitted>((event, emit) {
      // Handle submission logic (e.g., API call)
    });
  }
}
