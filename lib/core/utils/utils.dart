import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:mvp_engineer/application/auth/auth_bloc.dart";
import "package:mvp_engineer/core/routes/routes.dart";
import "package:mvp_engineer/domain/auth/auth_failures.dart";
import "package:mvp_engineer/domain/context/app_context.dart";
import "package:image_picker/image_picker.dart";
import "package:mvp_engineer/core/values/strings.dart";
import "package:mvp_engineer/global.dart";
import "package:mvp_shared_components/widgets/custom_snackbar.dart";

class Utils {
  static onLogOut() {
    BuildContext? context = AppContext.navigatorKey.currentContext;

    if (context != null) {
      // context.read<AuthBloc>().add(const AuthEvent.unauthenticate());
      try {
        // context.read<AuthBloc>().add(const AuthEvent.signedOut());
      } catch (_) {}
    }
  }

  static onServerLogOut(String message) async {
    BuildContext? context = AppContext.navigatorKey.currentContext;

    if (context != null) {
      context.read<AuthBloc>().add(const AuthEvent.forcedSignedOut());
      buildCustomSnackBar(
        context: context,
        message: message,
        error: true,
      );
      await AppGlobal.storageService.clearAll();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
    }
  }

  static navigateTo(String page, {bool? setAsRoot}) {
    BuildContext? context = AppContext.navigatorKey.currentContext;
    if (context != null) {
      if (setAsRoot != null) {
        Navigator.of(context).pushNamedAndRemoveUntil(page, (route) => false);
      } else {
        Navigator.of(context).pushNamed(page);
      }
    }
  }

  static ImageProvider<Object> buildImageProvider(
      String? image, ImageProvider<Object> errorImage) {
    return (image != null && image.isNotEmpty)
        ? NetworkImage(image)
        : errorImage;
  }

  static Future<ImageSource?> selectImageSource() async {
    final cxt = AppContext.instance.getNavigatorKey().currentContext;
    return showDialog<ImageSource>(
      context: cxt!,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(Strings.selectAnImageSource),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: const Text(Strings.camera),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: const Text(Strings.gallery),
          ),
        ],
      ),
    );
  }

  static handleAuthError(
    BuildContext context,
    AuthFailures failure,
  ) {
    String message = _getAuthFailure(failure);
    buildCustomSnackBar(context: context, message: message, error: true);
  }

  static handleSuccess(BuildContext context, String message) {
    buildCustomSnackBar(context: context, message: message, error: false);
  }

  static handleError(BuildContext context, String message) {
    buildCustomSnackBar(context: context, message: message, error: true);
  }

  // getAppFailure(AppFailures failure) {
  //   return failure.map(
  //     customError: (e) => e.message,
  //   );
  // }

  static _getAuthFailure(AuthFailures failure) {
    return failure.maybeMap(
      orElse: () => Strings.emailAlreadyInUse,
      emailAlreadyInUse: (value) => Strings.emailAlreadyInUse,
      serverError: (value) => value.message,
      invalidEmailAndPasswordCombination: (value) =>
          Strings.invalidEmailOrPassword,
    );
  }
}
