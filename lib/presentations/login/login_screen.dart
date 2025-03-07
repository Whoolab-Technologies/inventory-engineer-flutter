import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mvp_engineer/application/login/login_bloc.dart';
import 'package:mvp_engineer/core/routes/names.dart';
import 'package:mvp_engineer/core/utils/utils.dart';
import 'package:mvp_engineer/core/values/strings.dart';
import 'package:mvp_engineer/domain/auth/auth_value_objects.dart';
import 'package:mvp_engineer/global.dart';
import 'package:mvp_engineer/injection/failures.dart';
import 'package:mvp_shared_components/core/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  EmailAddress get _email => EmailAddress(_emailController.text);
  Password get _password => Password(_passwordController.text);

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

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateAndSubmit() {
    FocusScope.of(context).unfocus();
    final emailValidation = _email.value;
    final passwordValidation = _password.value;

    emailValidation.fold(
      (failure) => _showEmailError(failure),
      (email) => passwordValidation.fold(
        (failure) => _showPasswordError(failure),
        (password) => _submit(email, password),
      ),
    );
  }

  void _showEmailError(ValueFailure<String> failure) {
    String message = failure.maybeMap(
      orElse: () => "",
      invalidEmailAddress: (value) => Strings.invalidEmail,
      empty: (value) => Strings.empty,
    );
    Utils.handleError(context, message);
  }

  void _showPasswordError(ValueFailure<String> failure) {
    String message = failure.maybeMap(
      orElse: () => "",
      empty: (value) => Strings.empty,
      shortPassword: (value) => Strings.shortPassword,
      noSpecialSymbol: (value) => Strings.noSpecialSymbol,
      noNumber: (value) => Strings.noNumber,
      noUpperCase: (value) => Strings.noUpperCase,
    );
    Utils.handleError(context, message);
  }

  void _submit(String email, String password) {
    context.read<LoginBloc>().add(
          LoginEvent.onSubmit(email: email, password: password),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,

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
                                "Login",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
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
                          TextField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                              border: const OutlineInputBorder(),
                            ),
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(height: 8.0.h),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Handle forgot password
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0.h),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _validateAndSubmit,
                              child: const Text(
                                'Login',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listenWhen: (previous, current) =>
                        previous.isLoading != current.isLoading &&
                        current.loginFailureOrSuccess !=
                            previous.loginFailureOrSuccess,
                    listener: (context, state) {
                      state.loginFailureOrSuccess.fold(
                        () => null,
                        (a) => a.fold(
                          (l) {
                            Utils.handleAuthError(context, l);
                          },
                          (_) {
                            Utils.handleSuccess(
                              context,
                              Strings.loginSuccessMessage,
                            );
                            AppGlobal.storageService
                                .setBoolean(STORAGE_IS_LOGGED_IN, true);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                AppRoutes.HOME, (_) => false);

                            _emailController.clear();
                            _passwordController.clear();
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
