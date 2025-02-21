import 'package:mvp_engineer/injection/failures.dart';

class NotAuthenticatedError extends Error {}

class ServerError extends Error {
  final String error;

  ServerError(this.error);
  @override
  String toString() {
    const explanation = "Something went wrong";
    return Error.safeToString("$explanation Failure was: $error");
  }
}

class NotVerifiedError extends Error {
  final ValueFailure valueFailure;

  NotVerifiedError(this.valueFailure);
  @override
  String toString() {
    const explanation =
        "Encountered a ValueFailure at an unrecoverable point. Terminating.";
    return Error.safeToString("$explanation Failure was: $valueFailure");
  }
}

class UnExpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnExpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        "Encountered a ValueFailure at an unrecoverable point. Terminating.";
    return Error.safeToString("$explanation Failure was: $valueFailure");
  }
}

class EmptyValueError extends Error {
  final ValueFailure valueFailure;

  EmptyValueError(this.valueFailure);

  @override
  String toString() {
    return "";
  }
}
