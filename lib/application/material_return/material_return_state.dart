part of 'material_return_bloc.dart';

@freezed
class MaterialReturnState with _$MaterialReturnState {
  const factory MaterialReturnState(
      {required bool isloading,
      required bool uploading,
      required List<Product> products,
      required List<MaterialReturn> items,
      required Option<Either<AppFailure, MaterialReturn>>
          materialReturnCreateFailureOrsuccess,
      required Option<Either<AppFailure, List<MaterialReturn>>>
          materialReturnListFailureOrsuccess,
      required Option<Either<AppFailure, List<Product>>>
          getProductsFailureOrSuccess}) = _MaterialReturnState;
  factory MaterialReturnState.initial() => MaterialReturnState(
        isloading: true,
        uploading: false,
        products: [],
        items: [],
        getProductsFailureOrSuccess: none(),
        materialReturnCreateFailureOrsuccess: none(),
        materialReturnListFailureOrsuccess: none(),
      );
}
