// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMaterialRequests,
    required TResult Function(String product, int quantity) productAdded,
    required TResult Function(String product) productRemoved,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMaterialRequests,
    TResult? Function(String product, int quantity)? productAdded,
    TResult? Function(String product)? productRemoved,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMaterialRequests,
    TResult Function(String product, int quantity)? productAdded,
    TResult Function(String product)? productRemoved,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMaterialRequests value)
        fetchMaterialRequests,
    required TResult Function(MaterialRequestProductAdded value) productAdded,
    required TResult Function(MaterialRequestProductRemoved value)
        productRemoved,
    required TResult Function(MaterialRequestDescriptionChanged value)
        descriptionChanged,
    required TResult Function(MaterialRequestSubmitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult? Function(MaterialRequestProductAdded value)? productAdded,
    TResult? Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult? Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult? Function(MaterialRequestSubmitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult Function(MaterialRequestProductAdded value)? productAdded,
    TResult Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult Function(MaterialRequestSubmitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialRequestEventCopyWith<$Res> {
  factory $MaterialRequestEventCopyWith(MaterialRequestEvent value,
          $Res Function(MaterialRequestEvent) then) =
      _$MaterialRequestEventCopyWithImpl<$Res, MaterialRequestEvent>;
}

/// @nodoc
class _$MaterialRequestEventCopyWithImpl<$Res,
        $Val extends MaterialRequestEvent>
    implements $MaterialRequestEventCopyWith<$Res> {
  _$MaterialRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchMaterialRequestsImplCopyWith<$Res> {
  factory _$$FetchMaterialRequestsImplCopyWith(
          _$FetchMaterialRequestsImpl value,
          $Res Function(_$FetchMaterialRequestsImpl) then) =
      __$$FetchMaterialRequestsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchMaterialRequestsImplCopyWithImpl<$Res>
    extends _$MaterialRequestEventCopyWithImpl<$Res,
        _$FetchMaterialRequestsImpl>
    implements _$$FetchMaterialRequestsImplCopyWith<$Res> {
  __$$FetchMaterialRequestsImplCopyWithImpl(_$FetchMaterialRequestsImpl _value,
      $Res Function(_$FetchMaterialRequestsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchMaterialRequestsImpl implements FetchMaterialRequests {
  const _$FetchMaterialRequestsImpl();

  @override
  String toString() {
    return 'MaterialRequestEvent.fetchMaterialRequests()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMaterialRequestsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMaterialRequests,
    required TResult Function(String product, int quantity) productAdded,
    required TResult Function(String product) productRemoved,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() submitted,
  }) {
    return fetchMaterialRequests();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMaterialRequests,
    TResult? Function(String product, int quantity)? productAdded,
    TResult? Function(String product)? productRemoved,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function()? submitted,
  }) {
    return fetchMaterialRequests?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMaterialRequests,
    TResult Function(String product, int quantity)? productAdded,
    TResult Function(String product)? productRemoved,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (fetchMaterialRequests != null) {
      return fetchMaterialRequests();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMaterialRequests value)
        fetchMaterialRequests,
    required TResult Function(MaterialRequestProductAdded value) productAdded,
    required TResult Function(MaterialRequestProductRemoved value)
        productRemoved,
    required TResult Function(MaterialRequestDescriptionChanged value)
        descriptionChanged,
    required TResult Function(MaterialRequestSubmitted value) submitted,
  }) {
    return fetchMaterialRequests(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult? Function(MaterialRequestProductAdded value)? productAdded,
    TResult? Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult? Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult? Function(MaterialRequestSubmitted value)? submitted,
  }) {
    return fetchMaterialRequests?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult Function(MaterialRequestProductAdded value)? productAdded,
    TResult Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult Function(MaterialRequestSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (fetchMaterialRequests != null) {
      return fetchMaterialRequests(this);
    }
    return orElse();
  }
}

abstract class FetchMaterialRequests implements MaterialRequestEvent {
  const factory FetchMaterialRequests() = _$FetchMaterialRequestsImpl;
}

/// @nodoc
abstract class _$$MaterialRequestProductAddedImplCopyWith<$Res> {
  factory _$$MaterialRequestProductAddedImplCopyWith(
          _$MaterialRequestProductAddedImpl value,
          $Res Function(_$MaterialRequestProductAddedImpl) then) =
      __$$MaterialRequestProductAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String product, int quantity});
}

/// @nodoc
class __$$MaterialRequestProductAddedImplCopyWithImpl<$Res>
    extends _$MaterialRequestEventCopyWithImpl<$Res,
        _$MaterialRequestProductAddedImpl>
    implements _$$MaterialRequestProductAddedImplCopyWith<$Res> {
  __$$MaterialRequestProductAddedImplCopyWithImpl(
      _$MaterialRequestProductAddedImpl _value,
      $Res Function(_$MaterialRequestProductAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$MaterialRequestProductAddedImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MaterialRequestProductAddedImpl implements MaterialRequestProductAdded {
  const _$MaterialRequestProductAddedImpl(this.product, this.quantity);

  @override
  final String product;
  @override
  final int quantity;

  @override
  String toString() {
    return 'MaterialRequestEvent.productAdded(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRequestProductAddedImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRequestProductAddedImplCopyWith<_$MaterialRequestProductAddedImpl>
      get copyWith => __$$MaterialRequestProductAddedImplCopyWithImpl<
          _$MaterialRequestProductAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMaterialRequests,
    required TResult Function(String product, int quantity) productAdded,
    required TResult Function(String product) productRemoved,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() submitted,
  }) {
    return productAdded(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMaterialRequests,
    TResult? Function(String product, int quantity)? productAdded,
    TResult? Function(String product)? productRemoved,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function()? submitted,
  }) {
    return productAdded?.call(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMaterialRequests,
    TResult Function(String product, int quantity)? productAdded,
    TResult Function(String product)? productRemoved,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (productAdded != null) {
      return productAdded(product, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMaterialRequests value)
        fetchMaterialRequests,
    required TResult Function(MaterialRequestProductAdded value) productAdded,
    required TResult Function(MaterialRequestProductRemoved value)
        productRemoved,
    required TResult Function(MaterialRequestDescriptionChanged value)
        descriptionChanged,
    required TResult Function(MaterialRequestSubmitted value) submitted,
  }) {
    return productAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult? Function(MaterialRequestProductAdded value)? productAdded,
    TResult? Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult? Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult? Function(MaterialRequestSubmitted value)? submitted,
  }) {
    return productAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult Function(MaterialRequestProductAdded value)? productAdded,
    TResult Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult Function(MaterialRequestSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (productAdded != null) {
      return productAdded(this);
    }
    return orElse();
  }
}

abstract class MaterialRequestProductAdded implements MaterialRequestEvent {
  const factory MaterialRequestProductAdded(
          final String product, final int quantity) =
      _$MaterialRequestProductAddedImpl;

  String get product;
  int get quantity;

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialRequestProductAddedImplCopyWith<_$MaterialRequestProductAddedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaterialRequestProductRemovedImplCopyWith<$Res> {
  factory _$$MaterialRequestProductRemovedImplCopyWith(
          _$MaterialRequestProductRemovedImpl value,
          $Res Function(_$MaterialRequestProductRemovedImpl) then) =
      __$$MaterialRequestProductRemovedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String product});
}

/// @nodoc
class __$$MaterialRequestProductRemovedImplCopyWithImpl<$Res>
    extends _$MaterialRequestEventCopyWithImpl<$Res,
        _$MaterialRequestProductRemovedImpl>
    implements _$$MaterialRequestProductRemovedImplCopyWith<$Res> {
  __$$MaterialRequestProductRemovedImplCopyWithImpl(
      _$MaterialRequestProductRemovedImpl _value,
      $Res Function(_$MaterialRequestProductRemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$MaterialRequestProductRemovedImpl(
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MaterialRequestProductRemovedImpl
    implements MaterialRequestProductRemoved {
  const _$MaterialRequestProductRemovedImpl(this.product);

  @override
  final String product;

  @override
  String toString() {
    return 'MaterialRequestEvent.productRemoved(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRequestProductRemovedImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRequestProductRemovedImplCopyWith<
          _$MaterialRequestProductRemovedImpl>
      get copyWith => __$$MaterialRequestProductRemovedImplCopyWithImpl<
          _$MaterialRequestProductRemovedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMaterialRequests,
    required TResult Function(String product, int quantity) productAdded,
    required TResult Function(String product) productRemoved,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() submitted,
  }) {
    return productRemoved(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMaterialRequests,
    TResult? Function(String product, int quantity)? productAdded,
    TResult? Function(String product)? productRemoved,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function()? submitted,
  }) {
    return productRemoved?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMaterialRequests,
    TResult Function(String product, int quantity)? productAdded,
    TResult Function(String product)? productRemoved,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (productRemoved != null) {
      return productRemoved(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMaterialRequests value)
        fetchMaterialRequests,
    required TResult Function(MaterialRequestProductAdded value) productAdded,
    required TResult Function(MaterialRequestProductRemoved value)
        productRemoved,
    required TResult Function(MaterialRequestDescriptionChanged value)
        descriptionChanged,
    required TResult Function(MaterialRequestSubmitted value) submitted,
  }) {
    return productRemoved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult? Function(MaterialRequestProductAdded value)? productAdded,
    TResult? Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult? Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult? Function(MaterialRequestSubmitted value)? submitted,
  }) {
    return productRemoved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult Function(MaterialRequestProductAdded value)? productAdded,
    TResult Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult Function(MaterialRequestSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (productRemoved != null) {
      return productRemoved(this);
    }
    return orElse();
  }
}

abstract class MaterialRequestProductRemoved implements MaterialRequestEvent {
  const factory MaterialRequestProductRemoved(final String product) =
      _$MaterialRequestProductRemovedImpl;

  String get product;

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialRequestProductRemovedImplCopyWith<
          _$MaterialRequestProductRemovedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaterialRequestDescriptionChangedImplCopyWith<$Res> {
  factory _$$MaterialRequestDescriptionChangedImplCopyWith(
          _$MaterialRequestDescriptionChangedImpl value,
          $Res Function(_$MaterialRequestDescriptionChangedImpl) then) =
      __$$MaterialRequestDescriptionChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$MaterialRequestDescriptionChangedImplCopyWithImpl<$Res>
    extends _$MaterialRequestEventCopyWithImpl<$Res,
        _$MaterialRequestDescriptionChangedImpl>
    implements _$$MaterialRequestDescriptionChangedImplCopyWith<$Res> {
  __$$MaterialRequestDescriptionChangedImplCopyWithImpl(
      _$MaterialRequestDescriptionChangedImpl _value,
      $Res Function(_$MaterialRequestDescriptionChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
  }) {
    return _then(_$MaterialRequestDescriptionChangedImpl(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MaterialRequestDescriptionChangedImpl
    implements MaterialRequestDescriptionChanged {
  const _$MaterialRequestDescriptionChangedImpl(this.description);

  @override
  final String description;

  @override
  String toString() {
    return 'MaterialRequestEvent.descriptionChanged(description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRequestDescriptionChangedImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRequestDescriptionChangedImplCopyWith<
          _$MaterialRequestDescriptionChangedImpl>
      get copyWith => __$$MaterialRequestDescriptionChangedImplCopyWithImpl<
          _$MaterialRequestDescriptionChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMaterialRequests,
    required TResult Function(String product, int quantity) productAdded,
    required TResult Function(String product) productRemoved,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() submitted,
  }) {
    return descriptionChanged(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMaterialRequests,
    TResult? Function(String product, int quantity)? productAdded,
    TResult? Function(String product)? productRemoved,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function()? submitted,
  }) {
    return descriptionChanged?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMaterialRequests,
    TResult Function(String product, int quantity)? productAdded,
    TResult Function(String product)? productRemoved,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMaterialRequests value)
        fetchMaterialRequests,
    required TResult Function(MaterialRequestProductAdded value) productAdded,
    required TResult Function(MaterialRequestProductRemoved value)
        productRemoved,
    required TResult Function(MaterialRequestDescriptionChanged value)
        descriptionChanged,
    required TResult Function(MaterialRequestSubmitted value) submitted,
  }) {
    return descriptionChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult? Function(MaterialRequestProductAdded value)? productAdded,
    TResult? Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult? Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult? Function(MaterialRequestSubmitted value)? submitted,
  }) {
    return descriptionChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult Function(MaterialRequestProductAdded value)? productAdded,
    TResult Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult Function(MaterialRequestSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (descriptionChanged != null) {
      return descriptionChanged(this);
    }
    return orElse();
  }
}

abstract class MaterialRequestDescriptionChanged
    implements MaterialRequestEvent {
  const factory MaterialRequestDescriptionChanged(final String description) =
      _$MaterialRequestDescriptionChangedImpl;

  String get description;

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialRequestDescriptionChangedImplCopyWith<
          _$MaterialRequestDescriptionChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MaterialRequestSubmittedImplCopyWith<$Res> {
  factory _$$MaterialRequestSubmittedImplCopyWith(
          _$MaterialRequestSubmittedImpl value,
          $Res Function(_$MaterialRequestSubmittedImpl) then) =
      __$$MaterialRequestSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MaterialRequestSubmittedImplCopyWithImpl<$Res>
    extends _$MaterialRequestEventCopyWithImpl<$Res,
        _$MaterialRequestSubmittedImpl>
    implements _$$MaterialRequestSubmittedImplCopyWith<$Res> {
  __$$MaterialRequestSubmittedImplCopyWithImpl(
      _$MaterialRequestSubmittedImpl _value,
      $Res Function(_$MaterialRequestSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MaterialRequestSubmittedImpl implements MaterialRequestSubmitted {
  const _$MaterialRequestSubmittedImpl();

  @override
  String toString() {
    return 'MaterialRequestEvent.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRequestSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchMaterialRequests,
    required TResult Function(String product, int quantity) productAdded,
    required TResult Function(String product) productRemoved,
    required TResult Function(String description) descriptionChanged,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchMaterialRequests,
    TResult? Function(String product, int quantity)? productAdded,
    TResult? Function(String product)? productRemoved,
    TResult? Function(String description)? descriptionChanged,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchMaterialRequests,
    TResult Function(String product, int quantity)? productAdded,
    TResult Function(String product)? productRemoved,
    TResult Function(String description)? descriptionChanged,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchMaterialRequests value)
        fetchMaterialRequests,
    required TResult Function(MaterialRequestProductAdded value) productAdded,
    required TResult Function(MaterialRequestProductRemoved value)
        productRemoved,
    required TResult Function(MaterialRequestDescriptionChanged value)
        descriptionChanged,
    required TResult Function(MaterialRequestSubmitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult? Function(MaterialRequestProductAdded value)? productAdded,
    TResult? Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult? Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult? Function(MaterialRequestSubmitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchMaterialRequests value)? fetchMaterialRequests,
    TResult Function(MaterialRequestProductAdded value)? productAdded,
    TResult Function(MaterialRequestProductRemoved value)? productRemoved,
    TResult Function(MaterialRequestDescriptionChanged value)?
        descriptionChanged,
    TResult Function(MaterialRequestSubmitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class MaterialRequestSubmitted implements MaterialRequestEvent {
  const factory MaterialRequestSubmitted() = _$MaterialRequestSubmittedImpl;
}

/// @nodoc
mixin _$MaterialRequestState {
  List<Map<String, dynamic>> get mrItems => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<MaterialRequest> get materialRequests =>
      throw _privateConstructorUsedError;
  Option<Either<AppFailure, List<MaterialRequest>>>
      get materialRequestsFailureOrSuccess =>
          throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of MaterialRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialRequestStateCopyWith<MaterialRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialRequestStateCopyWith<$Res> {
  factory $MaterialRequestStateCopyWith(MaterialRequestState value,
          $Res Function(MaterialRequestState) then) =
      _$MaterialRequestStateCopyWithImpl<$Res, MaterialRequestState>;
  @useResult
  $Res call(
      {List<Map<String, dynamic>> mrItems,
      String description,
      List<MaterialRequest> materialRequests,
      Option<Either<AppFailure, List<MaterialRequest>>>
          materialRequestsFailureOrSuccess,
      bool isLoading});
}

/// @nodoc
class _$MaterialRequestStateCopyWithImpl<$Res,
        $Val extends MaterialRequestState>
    implements $MaterialRequestStateCopyWith<$Res> {
  _$MaterialRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mrItems = null,
    Object? description = null,
    Object? materialRequests = null,
    Object? materialRequestsFailureOrSuccess = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      mrItems: null == mrItems
          ? _value.mrItems
          : mrItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequests: null == materialRequests
          ? _value.materialRequests
          : materialRequests // ignore: cast_nullable_to_non_nullable
              as List<MaterialRequest>,
      materialRequestsFailureOrSuccess: null == materialRequestsFailureOrSuccess
          ? _value.materialRequestsFailureOrSuccess
          : materialRequestsFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, List<MaterialRequest>>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialRequestStateImplCopyWith<$Res>
    implements $MaterialRequestStateCopyWith<$Res> {
  factory _$$MaterialRequestStateImplCopyWith(_$MaterialRequestStateImpl value,
          $Res Function(_$MaterialRequestStateImpl) then) =
      __$$MaterialRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, dynamic>> mrItems,
      String description,
      List<MaterialRequest> materialRequests,
      Option<Either<AppFailure, List<MaterialRequest>>>
          materialRequestsFailureOrSuccess,
      bool isLoading});
}

/// @nodoc
class __$$MaterialRequestStateImplCopyWithImpl<$Res>
    extends _$MaterialRequestStateCopyWithImpl<$Res, _$MaterialRequestStateImpl>
    implements _$$MaterialRequestStateImplCopyWith<$Res> {
  __$$MaterialRequestStateImplCopyWithImpl(_$MaterialRequestStateImpl _value,
      $Res Function(_$MaterialRequestStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mrItems = null,
    Object? description = null,
    Object? materialRequests = null,
    Object? materialRequestsFailureOrSuccess = null,
    Object? isLoading = null,
  }) {
    return _then(_$MaterialRequestStateImpl(
      mrItems: null == mrItems
          ? _value._mrItems
          : mrItems // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialRequests: null == materialRequests
          ? _value._materialRequests
          : materialRequests // ignore: cast_nullable_to_non_nullable
              as List<MaterialRequest>,
      materialRequestsFailureOrSuccess: null == materialRequestsFailureOrSuccess
          ? _value.materialRequestsFailureOrSuccess
          : materialRequestsFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, List<MaterialRequest>>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MaterialRequestStateImpl implements _MaterialRequestState {
  const _$MaterialRequestStateImpl(
      {required final List<Map<String, dynamic>> mrItems,
      required this.description,
      required final List<MaterialRequest> materialRequests,
      required this.materialRequestsFailureOrSuccess,
      required this.isLoading})
      : _mrItems = mrItems,
        _materialRequests = materialRequests;

  final List<Map<String, dynamic>> _mrItems;
  @override
  List<Map<String, dynamic>> get mrItems {
    if (_mrItems is EqualUnmodifiableListView) return _mrItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mrItems);
  }

  @override
  final String description;
  final List<MaterialRequest> _materialRequests;
  @override
  List<MaterialRequest> get materialRequests {
    if (_materialRequests is EqualUnmodifiableListView)
      return _materialRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialRequests);
  }

  @override
  final Option<Either<AppFailure, List<MaterialRequest>>>
      materialRequestsFailureOrSuccess;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'MaterialRequestState(mrItems: $mrItems, description: $description, materialRequests: $materialRequests, materialRequestsFailureOrSuccess: $materialRequestsFailureOrSuccess, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRequestStateImpl &&
            const DeepCollectionEquality().equals(other._mrItems, _mrItems) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._materialRequests, _materialRequests) &&
            (identical(other.materialRequestsFailureOrSuccess,
                    materialRequestsFailureOrSuccess) ||
                other.materialRequestsFailureOrSuccess ==
                    materialRequestsFailureOrSuccess) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_mrItems),
      description,
      const DeepCollectionEquality().hash(_materialRequests),
      materialRequestsFailureOrSuccess,
      isLoading);

  /// Create a copy of MaterialRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRequestStateImplCopyWith<_$MaterialRequestStateImpl>
      get copyWith =>
          __$$MaterialRequestStateImplCopyWithImpl<_$MaterialRequestStateImpl>(
              this, _$identity);
}

abstract class _MaterialRequestState implements MaterialRequestState {
  const factory _MaterialRequestState(
      {required final List<Map<String, dynamic>> mrItems,
      required final String description,
      required final List<MaterialRequest> materialRequests,
      required final Option<Either<AppFailure, List<MaterialRequest>>>
          materialRequestsFailureOrSuccess,
      required final bool isLoading}) = _$MaterialRequestStateImpl;

  @override
  List<Map<String, dynamic>> get mrItems;
  @override
  String get description;
  @override
  List<MaterialRequest> get materialRequests;
  @override
  Option<Either<AppFailure, List<MaterialRequest>>>
      get materialRequestsFailureOrSuccess;
  @override
  bool get isLoading;

  /// Create a copy of MaterialRequestState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialRequestStateImplCopyWith<_$MaterialRequestStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
