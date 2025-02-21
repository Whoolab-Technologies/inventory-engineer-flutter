import 'package:dartz/dartz.dart';
import 'package:mvp_engineer/injection/failures.dart';
import 'package:mvp_engineer/injection/value_objects.dart';
import 'package:mvp_engineer/injection/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateStringNotEmpty(input).flatMap(validateEmailAddress),
    );
  }
  const EmailAddress._(this.value);
}

class VerificationCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory VerificationCode(String input) {
    return VerificationCode._(
      validateStringNotEmpty(input).flatMap(validateNumber),
    );
  }
  const VerificationCode._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validateStringNotEmpty(input).flatMap(validatePassword),
    );
  }
  const Password._(this.value);
}

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String input) {
    return Name._(validateStringNotEmpty(input).flatMap(validateName));
  }
  const Name._(this.value);
}
