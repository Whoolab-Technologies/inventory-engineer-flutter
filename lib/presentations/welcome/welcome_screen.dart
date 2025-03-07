import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvp_engineer/application/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_engineer/core/routes/routes.dart';
import 'package:mvp_engineer/global.dart';
import 'package:mvp_shared_components/core/constants.dart';
import 'package:mvp_shared_components/widgets/app_logo_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const AuthEvent.authCheckRequested());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.map(
              authInitial: (authInitial) => null,
              authenticated: (authenticated) {
                AppGlobal.storageService.setBoolean(STORAGE_IS_LOGGED_IN, true);

                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.HOME, (_) => false);
              },
              unauthenticated: (unauthenticated) {
                log('Unauthenticated');
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.LOGIN, (_) => false);
              });
        },
        child: const Center(child: AppLogoWidget()),
      )),
    );
  }
}
