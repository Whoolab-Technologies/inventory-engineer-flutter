import "package:dartz/dartz.dart";
import "package:mvp_engineer/injection/failures.dart";

// Either<ValueFailure<String>, String> validateOtp(
//   String input,
// ) {
//   if (input.length == 6) {
//     return right(input);
//   } else {
//     return left(
//       ValueFailure.invalidOtp(failedValue: input, max: 6),
//     );
//   }
// }

Either<ValueFailure<String>, String> validateStringNotEmpty(
  String input,
) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateName(String input) {
  RegExp nameRegex = RegExp("^[A-Za-z ]{2,50}\$");

  if (!nameRegex.hasMatch(input)) {
    return left(ValueFailure.invalidName(failedValue: input));
  } else {
    return right(input);
  }

  // if (input.isNotEmpty) {
  //   return right(input);
  // } else {
  //   return left(ValueFailure.invalidName(failedValue: input));
  // }
}

// Either<ValueFailure<String>, String> validateAddress(String input) {
//   if (input.isNotEmpty) {
//     return right(input);
//   } else {
//     return left(ValueFailure.invalidAddress(failedValue: input));
//   }
// }

Either<ValueFailure<String>, String> validateEmailAddress(
  String input,
) {
  // Maybe not the most robust way of email validation but it's good enough
  final emailRegex = RegExp(
      r'^[a-zA-Z0-9.a-zA-Z0-9.!#$%&"*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  if (emailRegex.hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmailAddress(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(
  String password,
) {
  final hasMinLength = password.length >= 6;
  // final hasUppercase = password.contains(RegExp("[A-Z]"));
  // final hasDigits = password.contains(RegExp("[0-9]"));
  // final hasSpecialCharacters =
  //     password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  if (!hasMinLength) {
    return left(
      ValueFailure.shortPassword(failedValue: password),
    );
  } else {
    return right(password);
  }
}

Either<ValueFailure<String>, String> validateNumber(
  String input,
) {
  if (RegExp("^[0-9]+\$").hasMatch(input)) {
    return right(input);
  } else {
    return left(
      ValueFailure.invalideNumber(
        failedValue: input,
      ),
    );
  }
}

// Either<ValueFailure<String>, String> validateConfirmPassword(
//     String input, Password password) {
//   if (password.value.getOrElse(() => "") == input) {
//     return right(input);
//   } else {
//     return left(ValueFailure.invalidConfirmPassword(failedValue: input));
//   }
// }

// Either<ValueFailure<String>, String> validateDOB(
//   String input,
// ) {
//   if (isDateValid(input)) {
//     return right(input);
//   } else {
//     return left(
//       ValueFailure.invalidDOB(
//         failedValue: input,
//       ),
//     );
//   }
// }

// Either<ValueFailure<bool>, bool> validatePrivacy(bool input) {
//   if (input) {
//     return right(input);
//   } else {
//     return left(ValueFailure.invalidPrivacy(failedValue: input));
//   }
// }

// bool isDateValid(String dateStr) {
//   try {
//     final DateFormat format = DateFormat('dd/MM/yyyy');
//     final DateTime dateTime = format.parse(dateStr);
//     return format.format(dateTime) == dateStr;
//   } catch (e) {
//     return false;
//   }
// }
