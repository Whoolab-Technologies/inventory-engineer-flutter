// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? all, String? searchTerm, String? engineerId)
        getProducts,
    required TResult Function(String productId) getProduct,
    required TResult Function() getStoresAndEngineer,
    required TResult Function(Engineer? enginer) setSelectedEngineer,
    required TResult Function(Store? store) setSelectedStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult? Function(String productId)? getProduct,
    TResult? Function()? getStoresAndEngineer,
    TResult? Function(Engineer? enginer)? setSelectedEngineer,
    TResult? Function(Store? store)? setSelectedStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult Function(String productId)? getProduct,
    TResult Function()? getStoresAndEngineer,
    TResult Function(Engineer? enginer)? setSelectedEngineer,
    TResult Function(Store? store)? setSelectedStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetStoresAndEngineers value)
        getStoresAndEngineer,
    required TResult Function(_OnSetSelectedEngineer value) setSelectedEngineer,
    required TResult Function(_OnSetSelectedStore value) setSelectedStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult? Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult? Function(_OnSetSelectedStore value)? setSelectedStore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult Function(_OnSetSelectedStore value)? setSelectedStore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsEventCopyWith<$Res> {
  factory $ProductsEventCopyWith(
          ProductsEvent value, $Res Function(ProductsEvent) then) =
      _$ProductsEventCopyWithImpl<$Res, ProductsEvent>;
}

/// @nodoc
class _$ProductsEventCopyWithImpl<$Res, $Val extends ProductsEvent>
    implements $ProductsEventCopyWith<$Res> {
  _$ProductsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ProductsEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? all, String? searchTerm, String? engineerId)
        getProducts,
    required TResult Function(String productId) getProduct,
    required TResult Function() getStoresAndEngineer,
    required TResult Function(Engineer? enginer) setSelectedEngineer,
    required TResult Function(Store? store) setSelectedStore,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult? Function(String productId)? getProduct,
    TResult? Function()? getStoresAndEngineer,
    TResult? Function(Engineer? enginer)? setSelectedEngineer,
    TResult? Function(Store? store)? setSelectedStore,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult Function(String productId)? getProduct,
    TResult Function()? getStoresAndEngineer,
    TResult Function(Engineer? enginer)? setSelectedEngineer,
    TResult Function(Store? store)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetStoresAndEngineers value)
        getStoresAndEngineer,
    required TResult Function(_OnSetSelectedEngineer value) setSelectedEngineer,
    required TResult Function(_OnSetSelectedStore value) setSelectedStore,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult? Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult? Function(_OnSetSelectedStore value)? setSelectedStore,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult Function(_OnSetSelectedStore value)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProductsEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetProductsImplCopyWith<$Res> {
  factory _$$GetProductsImplCopyWith(
          _$GetProductsImpl value, $Res Function(_$GetProductsImpl) then) =
      __$$GetProductsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool? all, String? searchTerm, String? engineerId});
}

/// @nodoc
class __$$GetProductsImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$GetProductsImpl>
    implements _$$GetProductsImplCopyWith<$Res> {
  __$$GetProductsImplCopyWithImpl(
      _$GetProductsImpl _value, $Res Function(_$GetProductsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? all = freezed,
    Object? searchTerm = freezed,
    Object? engineerId = freezed,
  }) {
    return _then(_$GetProductsImpl(
      all: freezed == all
          ? _value.all
          : all // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      engineerId: freezed == engineerId
          ? _value.engineerId
          : engineerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetProductsImpl implements _GetProducts {
  _$GetProductsImpl({this.all, this.searchTerm, this.engineerId});

  @override
  final bool? all;
  @override
  final String? searchTerm;
  @override
  final String? engineerId;

  @override
  String toString() {
    return 'ProductsEvent.getProducts(all: $all, searchTerm: $searchTerm, engineerId: $engineerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsImpl &&
            (identical(other.all, all) || other.all == all) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            (identical(other.engineerId, engineerId) ||
                other.engineerId == engineerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, all, searchTerm, engineerId);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      __$$GetProductsImplCopyWithImpl<_$GetProductsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? all, String? searchTerm, String? engineerId)
        getProducts,
    required TResult Function(String productId) getProduct,
    required TResult Function() getStoresAndEngineer,
    required TResult Function(Engineer? enginer) setSelectedEngineer,
    required TResult Function(Store? store) setSelectedStore,
  }) {
    return getProducts(all, searchTerm, engineerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult? Function(String productId)? getProduct,
    TResult? Function()? getStoresAndEngineer,
    TResult? Function(Engineer? enginer)? setSelectedEngineer,
    TResult? Function(Store? store)? setSelectedStore,
  }) {
    return getProducts?.call(all, searchTerm, engineerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult Function(String productId)? getProduct,
    TResult Function()? getStoresAndEngineer,
    TResult Function(Engineer? enginer)? setSelectedEngineer,
    TResult Function(Store? store)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(all, searchTerm, engineerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetStoresAndEngineers value)
        getStoresAndEngineer,
    required TResult Function(_OnSetSelectedEngineer value) setSelectedEngineer,
    required TResult Function(_OnSetSelectedStore value) setSelectedStore,
  }) {
    return getProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult? Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult? Function(_OnSetSelectedStore value)? setSelectedStore,
  }) {
    return getProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult Function(_OnSetSelectedStore value)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (getProducts != null) {
      return getProducts(this);
    }
    return orElse();
  }
}

abstract class _GetProducts implements ProductsEvent {
  factory _GetProducts(
      {final bool? all,
      final String? searchTerm,
      final String? engineerId}) = _$GetProductsImpl;

  bool? get all;
  String? get searchTerm;
  String? get engineerId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductsImplCopyWith<_$GetProductsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProductImplCopyWith<$Res> {
  factory _$$GetProductImplCopyWith(
          _$GetProductImpl value, $Res Function(_$GetProductImpl) then) =
      __$$GetProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String productId});
}

/// @nodoc
class __$$GetProductImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$GetProductImpl>
    implements _$$GetProductImplCopyWith<$Res> {
  __$$GetProductImplCopyWithImpl(
      _$GetProductImpl _value, $Res Function(_$GetProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$GetProductImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProductImpl implements _GetProduct {
  const _$GetProductImpl({required this.productId});

  @override
  final String productId;

  @override
  String toString() {
    return 'ProductsEvent.getProduct(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductImplCopyWith<_$GetProductImpl> get copyWith =>
      __$$GetProductImplCopyWithImpl<_$GetProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? all, String? searchTerm, String? engineerId)
        getProducts,
    required TResult Function(String productId) getProduct,
    required TResult Function() getStoresAndEngineer,
    required TResult Function(Engineer? enginer) setSelectedEngineer,
    required TResult Function(Store? store) setSelectedStore,
  }) {
    return getProduct(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult? Function(String productId)? getProduct,
    TResult? Function()? getStoresAndEngineer,
    TResult? Function(Engineer? enginer)? setSelectedEngineer,
    TResult? Function(Store? store)? setSelectedStore,
  }) {
    return getProduct?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult Function(String productId)? getProduct,
    TResult Function()? getStoresAndEngineer,
    TResult Function(Engineer? enginer)? setSelectedEngineer,
    TResult Function(Store? store)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetStoresAndEngineers value)
        getStoresAndEngineer,
    required TResult Function(_OnSetSelectedEngineer value) setSelectedEngineer,
    required TResult Function(_OnSetSelectedStore value) setSelectedStore,
  }) {
    return getProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult? Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult? Function(_OnSetSelectedStore value)? setSelectedStore,
  }) {
    return getProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult Function(_OnSetSelectedStore value)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct(this);
    }
    return orElse();
  }
}

abstract class _GetProduct implements ProductsEvent {
  const factory _GetProduct({required final String productId}) =
      _$GetProductImpl;

  String get productId;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductImplCopyWith<_$GetProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetStoresAndEngineersImplCopyWith<$Res> {
  factory _$$GetStoresAndEngineersImplCopyWith(
          _$GetStoresAndEngineersImpl value,
          $Res Function(_$GetStoresAndEngineersImpl) then) =
      __$$GetStoresAndEngineersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetStoresAndEngineersImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$GetStoresAndEngineersImpl>
    implements _$$GetStoresAndEngineersImplCopyWith<$Res> {
  __$$GetStoresAndEngineersImplCopyWithImpl(_$GetStoresAndEngineersImpl _value,
      $Res Function(_$GetStoresAndEngineersImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetStoresAndEngineersImpl implements _GetStoresAndEngineers {
  const _$GetStoresAndEngineersImpl();

  @override
  String toString() {
    return 'ProductsEvent.getStoresAndEngineer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetStoresAndEngineersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? all, String? searchTerm, String? engineerId)
        getProducts,
    required TResult Function(String productId) getProduct,
    required TResult Function() getStoresAndEngineer,
    required TResult Function(Engineer? enginer) setSelectedEngineer,
    required TResult Function(Store? store) setSelectedStore,
  }) {
    return getStoresAndEngineer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult? Function(String productId)? getProduct,
    TResult? Function()? getStoresAndEngineer,
    TResult? Function(Engineer? enginer)? setSelectedEngineer,
    TResult? Function(Store? store)? setSelectedStore,
  }) {
    return getStoresAndEngineer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult Function(String productId)? getProduct,
    TResult Function()? getStoresAndEngineer,
    TResult Function(Engineer? enginer)? setSelectedEngineer,
    TResult Function(Store? store)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (getStoresAndEngineer != null) {
      return getStoresAndEngineer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetStoresAndEngineers value)
        getStoresAndEngineer,
    required TResult Function(_OnSetSelectedEngineer value) setSelectedEngineer,
    required TResult Function(_OnSetSelectedStore value) setSelectedStore,
  }) {
    return getStoresAndEngineer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult? Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult? Function(_OnSetSelectedStore value)? setSelectedStore,
  }) {
    return getStoresAndEngineer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult Function(_OnSetSelectedStore value)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (getStoresAndEngineer != null) {
      return getStoresAndEngineer(this);
    }
    return orElse();
  }
}

abstract class _GetStoresAndEngineers implements ProductsEvent {
  const factory _GetStoresAndEngineers() = _$GetStoresAndEngineersImpl;
}

/// @nodoc
abstract class _$$OnSetSelectedEngineerImplCopyWith<$Res> {
  factory _$$OnSetSelectedEngineerImplCopyWith(
          _$OnSetSelectedEngineerImpl value,
          $Res Function(_$OnSetSelectedEngineerImpl) then) =
      __$$OnSetSelectedEngineerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Engineer? enginer});
}

/// @nodoc
class __$$OnSetSelectedEngineerImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$OnSetSelectedEngineerImpl>
    implements _$$OnSetSelectedEngineerImplCopyWith<$Res> {
  __$$OnSetSelectedEngineerImplCopyWithImpl(_$OnSetSelectedEngineerImpl _value,
      $Res Function(_$OnSetSelectedEngineerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enginer = freezed,
  }) {
    return _then(_$OnSetSelectedEngineerImpl(
      freezed == enginer
          ? _value.enginer
          : enginer // ignore: cast_nullable_to_non_nullable
              as Engineer?,
    ));
  }
}

/// @nodoc

class _$OnSetSelectedEngineerImpl implements _OnSetSelectedEngineer {
  const _$OnSetSelectedEngineerImpl(this.enginer);

  @override
  final Engineer? enginer;

  @override
  String toString() {
    return 'ProductsEvent.setSelectedEngineer(enginer: $enginer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSetSelectedEngineerImpl &&
            (identical(other.enginer, enginer) || other.enginer == enginer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, enginer);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSetSelectedEngineerImplCopyWith<_$OnSetSelectedEngineerImpl>
      get copyWith => __$$OnSetSelectedEngineerImplCopyWithImpl<
          _$OnSetSelectedEngineerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? all, String? searchTerm, String? engineerId)
        getProducts,
    required TResult Function(String productId) getProduct,
    required TResult Function() getStoresAndEngineer,
    required TResult Function(Engineer? enginer) setSelectedEngineer,
    required TResult Function(Store? store) setSelectedStore,
  }) {
    return setSelectedEngineer(enginer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult? Function(String productId)? getProduct,
    TResult? Function()? getStoresAndEngineer,
    TResult? Function(Engineer? enginer)? setSelectedEngineer,
    TResult? Function(Store? store)? setSelectedStore,
  }) {
    return setSelectedEngineer?.call(enginer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult Function(String productId)? getProduct,
    TResult Function()? getStoresAndEngineer,
    TResult Function(Engineer? enginer)? setSelectedEngineer,
    TResult Function(Store? store)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (setSelectedEngineer != null) {
      return setSelectedEngineer(enginer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetStoresAndEngineers value)
        getStoresAndEngineer,
    required TResult Function(_OnSetSelectedEngineer value) setSelectedEngineer,
    required TResult Function(_OnSetSelectedStore value) setSelectedStore,
  }) {
    return setSelectedEngineer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult? Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult? Function(_OnSetSelectedStore value)? setSelectedStore,
  }) {
    return setSelectedEngineer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult Function(_OnSetSelectedStore value)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (setSelectedEngineer != null) {
      return setSelectedEngineer(this);
    }
    return orElse();
  }
}

abstract class _OnSetSelectedEngineer implements ProductsEvent {
  const factory _OnSetSelectedEngineer(final Engineer? enginer) =
      _$OnSetSelectedEngineerImpl;

  Engineer? get enginer;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnSetSelectedEngineerImplCopyWith<_$OnSetSelectedEngineerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSetSelectedStoreImplCopyWith<$Res> {
  factory _$$OnSetSelectedStoreImplCopyWith(_$OnSetSelectedStoreImpl value,
          $Res Function(_$OnSetSelectedStoreImpl) then) =
      __$$OnSetSelectedStoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Store? store});
}

/// @nodoc
class __$$OnSetSelectedStoreImplCopyWithImpl<$Res>
    extends _$ProductsEventCopyWithImpl<$Res, _$OnSetSelectedStoreImpl>
    implements _$$OnSetSelectedStoreImplCopyWith<$Res> {
  __$$OnSetSelectedStoreImplCopyWithImpl(_$OnSetSelectedStoreImpl _value,
      $Res Function(_$OnSetSelectedStoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? store = freezed,
  }) {
    return _then(_$OnSetSelectedStoreImpl(
      freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as Store?,
    ));
  }
}

/// @nodoc

class _$OnSetSelectedStoreImpl implements _OnSetSelectedStore {
  const _$OnSetSelectedStoreImpl(this.store);

  @override
  final Store? store;

  @override
  String toString() {
    return 'ProductsEvent.setSelectedStore(store: $store)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSetSelectedStoreImpl &&
            (identical(other.store, store) || other.store == store));
  }

  @override
  int get hashCode => Object.hash(runtimeType, store);

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSetSelectedStoreImplCopyWith<_$OnSetSelectedStoreImpl> get copyWith =>
      __$$OnSetSelectedStoreImplCopyWithImpl<_$OnSetSelectedStoreImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(bool? all, String? searchTerm, String? engineerId)
        getProducts,
    required TResult Function(String productId) getProduct,
    required TResult Function() getStoresAndEngineer,
    required TResult Function(Engineer? enginer) setSelectedEngineer,
    required TResult Function(Store? store) setSelectedStore,
  }) {
    return setSelectedStore(store);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult? Function(String productId)? getProduct,
    TResult? Function()? getStoresAndEngineer,
    TResult? Function(Engineer? enginer)? setSelectedEngineer,
    TResult? Function(Store? store)? setSelectedStore,
  }) {
    return setSelectedStore?.call(store);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(bool? all, String? searchTerm, String? engineerId)?
        getProducts,
    TResult Function(String productId)? getProduct,
    TResult Function()? getStoresAndEngineer,
    TResult Function(Engineer? enginer)? setSelectedEngineer,
    TResult Function(Store? store)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (setSelectedStore != null) {
      return setSelectedStore(store);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProducts value) getProducts,
    required TResult Function(_GetProduct value) getProduct,
    required TResult Function(_GetStoresAndEngineers value)
        getStoresAndEngineer,
    required TResult Function(_OnSetSelectedEngineer value) setSelectedEngineer,
    required TResult Function(_OnSetSelectedStore value) setSelectedStore,
  }) {
    return setSelectedStore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProducts value)? getProducts,
    TResult? Function(_GetProduct value)? getProduct,
    TResult? Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult? Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult? Function(_OnSetSelectedStore value)? setSelectedStore,
  }) {
    return setSelectedStore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProducts value)? getProducts,
    TResult Function(_GetProduct value)? getProduct,
    TResult Function(_GetStoresAndEngineers value)? getStoresAndEngineer,
    TResult Function(_OnSetSelectedEngineer value)? setSelectedEngineer,
    TResult Function(_OnSetSelectedStore value)? setSelectedStore,
    required TResult orElse(),
  }) {
    if (setSelectedStore != null) {
      return setSelectedStore(this);
    }
    return orElse();
  }
}

abstract class _OnSetSelectedStore implements ProductsEvent {
  const factory _OnSetSelectedStore(final Store? store) =
      _$OnSetSelectedStoreImpl;

  Store? get store;

  /// Create a copy of ProductsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnSetSelectedStoreImplCopyWith<_$OnSetSelectedStoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductsState {
  bool get isloading => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  String? get searchTerm => throw _privateConstructorUsedError;
  Option<Either<AppFailure, List<Product>>> get productListFailureOrSuccess =>
      throw _privateConstructorUsedError;
  Option<Either<AppFailure, Map<String, dynamic>>>
      get productFailureOrSuccess => throw _privateConstructorUsedError;
  Option<Either<AppFailure, Map<String, dynamic>>>
      get storesAndEngineersFailureOrSuccess =>
          throw _privateConstructorUsedError;
  Engineer? get selectedEngineer => throw _privateConstructorUsedError;
  Store? get selectedStore => throw _privateConstructorUsedError;
  List<Store> get stores => throw _privateConstructorUsedError;
  List<Engineer> get engineers => throw _privateConstructorUsedError;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductsStateCopyWith<ProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductsStateCopyWith<$Res> {
  factory $ProductsStateCopyWith(
          ProductsState value, $Res Function(ProductsState) then) =
      _$ProductsStateCopyWithImpl<$Res, ProductsState>;
  @useResult
  $Res call(
      {bool isloading,
      List<Product> products,
      String? searchTerm,
      Option<Either<AppFailure, List<Product>>> productListFailureOrSuccess,
      Option<Either<AppFailure, Map<String, dynamic>>> productFailureOrSuccess,
      Option<Either<AppFailure, Map<String, dynamic>>>
          storesAndEngineersFailureOrSuccess,
      Engineer? selectedEngineer,
      Store? selectedStore,
      List<Store> stores,
      List<Engineer> engineers});
}

/// @nodoc
class _$ProductsStateCopyWithImpl<$Res, $Val extends ProductsState>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? products = null,
    Object? searchTerm = freezed,
    Object? productListFailureOrSuccess = null,
    Object? productFailureOrSuccess = null,
    Object? storesAndEngineersFailureOrSuccess = null,
    Object? selectedEngineer = freezed,
    Object? selectedStore = freezed,
    Object? stores = null,
    Object? engineers = null,
  }) {
    return _then(_value.copyWith(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      productListFailureOrSuccess: null == productListFailureOrSuccess
          ? _value.productListFailureOrSuccess
          : productListFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, List<Product>>>,
      productFailureOrSuccess: null == productFailureOrSuccess
          ? _value.productFailureOrSuccess
          : productFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Map<String, dynamic>>>,
      storesAndEngineersFailureOrSuccess: null ==
              storesAndEngineersFailureOrSuccess
          ? _value.storesAndEngineersFailureOrSuccess
          : storesAndEngineersFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Map<String, dynamic>>>,
      selectedEngineer: freezed == selectedEngineer
          ? _value.selectedEngineer
          : selectedEngineer // ignore: cast_nullable_to_non_nullable
              as Engineer?,
      selectedStore: freezed == selectedStore
          ? _value.selectedStore
          : selectedStore // ignore: cast_nullable_to_non_nullable
              as Store?,
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
      engineers: null == engineers
          ? _value.engineers
          : engineers // ignore: cast_nullable_to_non_nullable
              as List<Engineer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductsStateImplCopyWith<$Res>
    implements $ProductsStateCopyWith<$Res> {
  factory _$$ProductsStateImplCopyWith(
          _$ProductsStateImpl value, $Res Function(_$ProductsStateImpl) then) =
      __$$ProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isloading,
      List<Product> products,
      String? searchTerm,
      Option<Either<AppFailure, List<Product>>> productListFailureOrSuccess,
      Option<Either<AppFailure, Map<String, dynamic>>> productFailureOrSuccess,
      Option<Either<AppFailure, Map<String, dynamic>>>
          storesAndEngineersFailureOrSuccess,
      Engineer? selectedEngineer,
      Store? selectedStore,
      List<Store> stores,
      List<Engineer> engineers});
}

/// @nodoc
class __$$ProductsStateImplCopyWithImpl<$Res>
    extends _$ProductsStateCopyWithImpl<$Res, _$ProductsStateImpl>
    implements _$$ProductsStateImplCopyWith<$Res> {
  __$$ProductsStateImplCopyWithImpl(
      _$ProductsStateImpl _value, $Res Function(_$ProductsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isloading = null,
    Object? products = null,
    Object? searchTerm = freezed,
    Object? productListFailureOrSuccess = null,
    Object? productFailureOrSuccess = null,
    Object? storesAndEngineersFailureOrSuccess = null,
    Object? selectedEngineer = freezed,
    Object? selectedStore = freezed,
    Object? stores = null,
    Object? engineers = null,
  }) {
    return _then(_$ProductsStateImpl(
      isloading: null == isloading
          ? _value.isloading
          : isloading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
      productListFailureOrSuccess: null == productListFailureOrSuccess
          ? _value.productListFailureOrSuccess
          : productListFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, List<Product>>>,
      productFailureOrSuccess: null == productFailureOrSuccess
          ? _value.productFailureOrSuccess
          : productFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Map<String, dynamic>>>,
      storesAndEngineersFailureOrSuccess: null ==
              storesAndEngineersFailureOrSuccess
          ? _value.storesAndEngineersFailureOrSuccess
          : storesAndEngineersFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, Map<String, dynamic>>>,
      selectedEngineer: freezed == selectedEngineer
          ? _value.selectedEngineer
          : selectedEngineer // ignore: cast_nullable_to_non_nullable
              as Engineer?,
      selectedStore: freezed == selectedStore
          ? _value.selectedStore
          : selectedStore // ignore: cast_nullable_to_non_nullable
              as Store?,
      stores: null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<Store>,
      engineers: null == engineers
          ? _value._engineers
          : engineers // ignore: cast_nullable_to_non_nullable
              as List<Engineer>,
    ));
  }
}

/// @nodoc

class _$ProductsStateImpl implements _ProductsState {
  const _$ProductsStateImpl(
      {required this.isloading,
      required final List<Product> products,
      required this.searchTerm,
      required this.productListFailureOrSuccess,
      required this.productFailureOrSuccess,
      required this.storesAndEngineersFailureOrSuccess,
      required this.selectedEngineer,
      required this.selectedStore,
      required final List<Store> stores,
      required final List<Engineer> engineers})
      : _products = products,
        _stores = stores,
        _engineers = engineers;

  @override
  final bool isloading;
  final List<Product> _products;
  @override
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String? searchTerm;
  @override
  final Option<Either<AppFailure, List<Product>>> productListFailureOrSuccess;
  @override
  final Option<Either<AppFailure, Map<String, dynamic>>>
      productFailureOrSuccess;
  @override
  final Option<Either<AppFailure, Map<String, dynamic>>>
      storesAndEngineersFailureOrSuccess;
  @override
  final Engineer? selectedEngineer;
  @override
  final Store? selectedStore;
  final List<Store> _stores;
  @override
  List<Store> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  final List<Engineer> _engineers;
  @override
  List<Engineer> get engineers {
    if (_engineers is EqualUnmodifiableListView) return _engineers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_engineers);
  }

  @override
  String toString() {
    return 'ProductsState(isloading: $isloading, products: $products, searchTerm: $searchTerm, productListFailureOrSuccess: $productListFailureOrSuccess, productFailureOrSuccess: $productFailureOrSuccess, storesAndEngineersFailureOrSuccess: $storesAndEngineersFailureOrSuccess, selectedEngineer: $selectedEngineer, selectedStore: $selectedStore, stores: $stores, engineers: $engineers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductsStateImpl &&
            (identical(other.isloading, isloading) ||
                other.isloading == isloading) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm) &&
            (identical(other.productListFailureOrSuccess,
                    productListFailureOrSuccess) ||
                other.productListFailureOrSuccess ==
                    productListFailureOrSuccess) &&
            (identical(
                    other.productFailureOrSuccess, productFailureOrSuccess) ||
                other.productFailureOrSuccess == productFailureOrSuccess) &&
            (identical(other.storesAndEngineersFailureOrSuccess,
                    storesAndEngineersFailureOrSuccess) ||
                other.storesAndEngineersFailureOrSuccess ==
                    storesAndEngineersFailureOrSuccess) &&
            (identical(other.selectedEngineer, selectedEngineer) ||
                other.selectedEngineer == selectedEngineer) &&
            (identical(other.selectedStore, selectedStore) ||
                other.selectedStore == selectedStore) &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            const DeepCollectionEquality()
                .equals(other._engineers, _engineers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isloading,
      const DeepCollectionEquality().hash(_products),
      searchTerm,
      productListFailureOrSuccess,
      productFailureOrSuccess,
      storesAndEngineersFailureOrSuccess,
      selectedEngineer,
      selectedStore,
      const DeepCollectionEquality().hash(_stores),
      const DeepCollectionEquality().hash(_engineers));

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      __$$ProductsStateImplCopyWithImpl<_$ProductsStateImpl>(this, _$identity);
}

abstract class _ProductsState implements ProductsState {
  const factory _ProductsState(
      {required final bool isloading,
      required final List<Product> products,
      required final String? searchTerm,
      required final Option<Either<AppFailure, List<Product>>>
          productListFailureOrSuccess,
      required final Option<Either<AppFailure, Map<String, dynamic>>>
          productFailureOrSuccess,
      required final Option<Either<AppFailure, Map<String, dynamic>>>
          storesAndEngineersFailureOrSuccess,
      required final Engineer? selectedEngineer,
      required final Store? selectedStore,
      required final List<Store> stores,
      required final List<Engineer> engineers}) = _$ProductsStateImpl;

  @override
  bool get isloading;
  @override
  List<Product> get products;
  @override
  String? get searchTerm;
  @override
  Option<Either<AppFailure, List<Product>>> get productListFailureOrSuccess;
  @override
  Option<Either<AppFailure, Map<String, dynamic>>> get productFailureOrSuccess;
  @override
  Option<Either<AppFailure, Map<String, dynamic>>>
      get storesAndEngineersFailureOrSuccess;
  @override
  Engineer? get selectedEngineer;
  @override
  Store? get selectedStore;
  @override
  List<Store> get stores;
  @override
  List<Engineer> get engineers;

  /// Create a copy of ProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductsStateImplCopyWith<_$ProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
