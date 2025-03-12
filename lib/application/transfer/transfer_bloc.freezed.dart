// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transfer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransferEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTransfers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTransfers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTransfers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTransfers value) getTransfers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTransfers value)? getTransfers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTransfers value)? getTransfers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferEventCopyWith<$Res> {
  factory $TransferEventCopyWith(
          TransferEvent value, $Res Function(TransferEvent) then) =
      _$TransferEventCopyWithImpl<$Res, TransferEvent>;
}

/// @nodoc
class _$TransferEventCopyWithImpl<$Res, $Val extends TransferEvent>
    implements $TransferEventCopyWith<$Res> {
  _$TransferEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetTransfersImplCopyWith<$Res> {
  factory _$$GetTransfersImplCopyWith(
          _$GetTransfersImpl value, $Res Function(_$GetTransfersImpl) then) =
      __$$GetTransfersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetTransfersImplCopyWithImpl<$Res>
    extends _$TransferEventCopyWithImpl<$Res, _$GetTransfersImpl>
    implements _$$GetTransfersImplCopyWith<$Res> {
  __$$GetTransfersImplCopyWithImpl(
      _$GetTransfersImpl _value, $Res Function(_$GetTransfersImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetTransfersImpl implements _GetTransfers {
  const _$GetTransfersImpl();

  @override
  String toString() {
    return 'TransferEvent.getTransfers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetTransfersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getTransfers,
  }) {
    return getTransfers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getTransfers,
  }) {
    return getTransfers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getTransfers,
    required TResult orElse(),
  }) {
    if (getTransfers != null) {
      return getTransfers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetTransfers value) getTransfers,
  }) {
    return getTransfers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetTransfers value)? getTransfers,
  }) {
    return getTransfers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetTransfers value)? getTransfers,
    required TResult orElse(),
  }) {
    if (getTransfers != null) {
      return getTransfers(this);
    }
    return orElse();
  }
}

abstract class _GetTransfers implements TransferEvent {
  const factory _GetTransfers() = _$GetTransfersImpl;
}

/// @nodoc
mixin _$TransferState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Transfer> get transfers => throw _privateConstructorUsedError;
  Option<Either<AppFailure, List<Transfer>>>
      get transfersListFailureOrSuccess => throw _privateConstructorUsedError;

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransferStateCopyWith<TransferState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransferStateCopyWith<$Res> {
  factory $TransferStateCopyWith(
          TransferState value, $Res Function(TransferState) then) =
      _$TransferStateCopyWithImpl<$Res, TransferState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Transfer> transfers,
      Option<Either<AppFailure, List<Transfer>>>
          transfersListFailureOrSuccess});
}

/// @nodoc
class _$TransferStateCopyWithImpl<$Res, $Val extends TransferState>
    implements $TransferStateCopyWith<$Res> {
  _$TransferStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transfers = null,
    Object? transfersListFailureOrSuccess = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<Transfer>,
      transfersListFailureOrSuccess: null == transfersListFailureOrSuccess
          ? _value.transfersListFailureOrSuccess
          : transfersListFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, List<Transfer>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransferStateImplCopyWith<$Res>
    implements $TransferStateCopyWith<$Res> {
  factory _$$TransferStateImplCopyWith(
          _$TransferStateImpl value, $Res Function(_$TransferStateImpl) then) =
      __$$TransferStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Transfer> transfers,
      Option<Either<AppFailure, List<Transfer>>>
          transfersListFailureOrSuccess});
}

/// @nodoc
class __$$TransferStateImplCopyWithImpl<$Res>
    extends _$TransferStateCopyWithImpl<$Res, _$TransferStateImpl>
    implements _$$TransferStateImplCopyWith<$Res> {
  __$$TransferStateImplCopyWithImpl(
      _$TransferStateImpl _value, $Res Function(_$TransferStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? transfers = null,
    Object? transfersListFailureOrSuccess = null,
  }) {
    return _then(_$TransferStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      transfers: null == transfers
          ? _value._transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<Transfer>,
      transfersListFailureOrSuccess: null == transfersListFailureOrSuccess
          ? _value.transfersListFailureOrSuccess
          : transfersListFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailure, List<Transfer>>>,
    ));
  }
}

/// @nodoc

class _$TransferStateImpl implements _TransferState {
  const _$TransferStateImpl(
      {required this.isLoading,
      required final List<Transfer> transfers,
      required this.transfersListFailureOrSuccess})
      : _transfers = transfers;

  @override
  final bool isLoading;
  final List<Transfer> _transfers;
  @override
  List<Transfer> get transfers {
    if (_transfers is EqualUnmodifiableListView) return _transfers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transfers);
  }

  @override
  final Option<Either<AppFailure, List<Transfer>>>
      transfersListFailureOrSuccess;

  @override
  String toString() {
    return 'TransferState(isLoading: $isLoading, transfers: $transfers, transfersListFailureOrSuccess: $transfersListFailureOrSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransferStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._transfers, _transfers) &&
            (identical(other.transfersListFailureOrSuccess,
                    transfersListFailureOrSuccess) ||
                other.transfersListFailureOrSuccess ==
                    transfersListFailureOrSuccess));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_transfers),
      transfersListFailureOrSuccess);

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransferStateImplCopyWith<_$TransferStateImpl> get copyWith =>
      __$$TransferStateImplCopyWithImpl<_$TransferStateImpl>(this, _$identity);
}

abstract class _TransferState implements TransferState {
  const factory _TransferState(
      {required final bool isLoading,
      required final List<Transfer> transfers,
      required final Option<Either<AppFailure, List<Transfer>>>
          transfersListFailureOrSuccess}) = _$TransferStateImpl;

  @override
  bool get isLoading;
  @override
  List<Transfer> get transfers;
  @override
  Option<Either<AppFailure, List<Transfer>>> get transfersListFailureOrSuccess;

  /// Create a copy of TransferState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransferStateImplCopyWith<_$TransferStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
