import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/password_reset/password_reset_bloc.dart';
import 'package:mvp_engineer/core/routes/names.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/auth/auth_value_objects.dart';
import 'package:mvp_engineer/injection/failures.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();

  EmailAddress get _email => EmailAddress(_emailController.text);

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  void _validateAndSubmit() {
    FocusScope.of(context).unfocus();
    final emailValidation = _email.value;

    emailValidation.fold(
        (failure) => _showEmailError(failure), (email) => _submit(email));
  }

  void _showEmailError(ValueFailure<String> failure) {
    String message = failure.maybeMap(
      orElse: () => "",
      invalidEmailAddress: (value) => Strings.invalidEmail,
      empty: (value) => Strings.empty,
    );
    Utils.handleError(context, message);
  }

  void _submit(String email) {
    setState(() {
      _isLoading = true;
    });
    context.read<PasswordResetBloc>().add(
          PasswordResetEvent.onSubmit(email: email),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Stack(
                children: [
                  Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(16.0.w),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/logo.png"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0.h),
                              Text(
                                "Reset Password",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0.h),
                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                            ),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(height: 16.0.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  AppRoutes.LOGIN,
                                  (_) => false,
                                );
                              },
                              child: Text(
                                'Back to Login',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _validateAndSubmit,
                              child: _isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'Send Reset Link',
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocListener<PasswordResetBloc, PasswordResetState>(
                    listenWhen: (previous, current) =>
                        previous.isLoading != current.isLoading &&
                        current.passwordRestLinkFailuresOrSuccess !=
                            previous.passwordRestLinkFailuresOrSuccess,
                    listener: (context, state) {
                      state.passwordRestLinkFailuresOrSuccess.fold(
                        () => null,
                        (a) => a.fold(
                          (l) {
                            setState(() {
                              _isLoading = false;
                            });
                            Utils.handleAuthError(context, l);
                          },
                          (_) {
                            Utils.handleSuccess(
                              context,
                              Strings.passwordResetLinkSent,
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.LOGIN, (_) => false);
                            _emailController.clear();
                            setState(() {
                              _isLoading = false;
                            });
                          },
                        ),
                      );
                    },
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
