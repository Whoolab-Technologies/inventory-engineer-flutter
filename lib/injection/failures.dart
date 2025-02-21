import "package:freezed_annotation/freezed_annotation.dart";

part "failures.freezed.dart";

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  // const factory ValueFailure.invalidPhoneNumber({
  //   required T failedValue,
  //   required int max,
  // }) = InvalidPhoneNumber<T>;

  // const factory ValueFailure.invalidOtp({
  //   required T failedValue,
  //   required int max,
  // }) = InvalidOtp<T>;

  const factory ValueFailure.empty({required T failedValue}) = Empty<T>;
  const factory ValueFailure.invalidName({required T failedValue}) =
      InvalidName<T>;
  // const factory ValueFailure.invalidAddress({required T failedValue}) =
  //     InvalidAddress<T>;

  const factory ValueFailure.invalidEmailAddress({
    required T failedValue,
  }) = InvalidEmailAddress<T>;

  const factory ValueFailure.noUpperCase({
    required T failedValue,
  }) = noUpperCase<T>;

  const factory ValueFailure.shortPassword({
    required T failedValue,
  }) = shortPassword<T>;

  const factory ValueFailure.noNumber({
    required T failedValue,
  }) = noNumber<T>;

  const factory ValueFailure.noSpecialSymbol({
    required T failedValue,
  }) = noSpecialSymbol<T>;

  const factory ValueFailure.invalideNumber({required T failedValue}) =
      InvalidNumber<T>;

  // const factory ValueFailure.invalidConfirmPassword({required T failedValue}) =
  //     InvalidConfirmPassword<T>;

  // const factory ValueFailure.invalidPrivacy({required T failedValue}) =
  //     InvalidPrivacy<T>;

  // const factory ValueFailure.notVerifed({required T failedValue}) =
  //     NotVerifed<T>;

  // const factory ValueFailure.invalidDOB({required T failedValue}) =
  //     InvalidDOB<T>;

  // const factory ValueFailure.invalidPassword({
  //   required T failedValue,
  //   required int min,
  // }) = InvalidPassword<T>;
}
