import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_engineer/application/auth/auth_bloc.dart';
import 'package:mvp_engineer/application/home/home_bloc.dart';
import 'package:mvp_engineer/application/login/login_bloc.dart';
import 'package:mvp_engineer/application/material_request/material_request_bloc.dart';
import 'package:mvp_engineer/application/password_reset/password_reset_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/application/transfer/transfer_bloc.dart';
import 'package:mvp_engineer/global.dart';
import 'package:mvp_engineer/injection/injection.dart';
import 'package:mvp_engineer/presentations/home/home_screen.dart';
import 'package:mvp_engineer/presentations/login/login_screen.dart';
import 'package:mvp_engineer/presentations/material_requests/material_request_screen.dart';
import 'package:mvp_engineer/presentations/password-reset/password_reset_screen.dart';
import 'package:mvp_engineer/presentations/products/products_screen.dart';
import 'package:mvp_engineer/presentations/transfer/transfer_screen.dart';
// import 'package:mvp_engineer/injection/injection.dart';
// import 'package:mvp_engineer/presentation/home/home_screen.dart';
// import 'package:mvp_engineer/presentation/landing/landing_screen.dart';
// import 'package:mvp_engineer/presentation/login/login_screen.dart';
// import 'package:mvp_engineer/presentation/products/products_screen.dart';
// import 'package:mvp_engineer/presentation/register/register_screen.dart';
// import 'package:mvp_engineer/presentation/report/reports_screen.dart';
import 'package:mvp_engineer/presentations/welcome/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'routes.dart';

class AppPages {
  static List<PageEntity> pages() => [
        PageEntity(
          route: AppRoutes.INITIAL,
          page: const WelcomeScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),
        ),
        PageEntity(
          route: AppRoutes.LOGIN,
          page: const LoginScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<LoginBloc>(),
          ),
        ),
        PageEntity(
          route: AppRoutes.RESET,
          page: const PasswordResetScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<PasswordResetBloc>(),
          ),
        ),
        PageEntity(
          route: AppRoutes.HOME,
          page: const HomeScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<HomeBloc>(),
          ),
        ),
        PageEntity(
          route: AppRoutes.PRODUCTS,
          page: const ProductsScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<ProductsBloc>(),
          ),
        ),
        PageEntity(
          route: AppRoutes.MR,
          page: const MaterialRequestScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<MaterialRequestBloc>(),
          ),
        ),
        PageEntity(
          route: AppRoutes.TRANSFERS,
          page: const TransferScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<TransferBloc>(),
          ),
        ),
      ];

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = [];
    blocProviders.addAll(
      [
        // BlocProvider(
        //   create: (context) => PushNotificationBloc(),
        // ),
      ],
    );
    for (var page in pages()) {
      if (page.bloc != null) {
        blocProviders.add(page.bloc);
      }
    }
    return blocProviders;
  }

  static PageTransition onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      final result =
          AppPages.pages().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        if (result.first.route == AppRoutes.LOGIN) {
          bool isLoggedIn = AppGlobal.storageService.isLoggedIn();
          if (isLoggedIn) {
            return PageTransition(
              child: const HomeScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          }
          return PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.fade,
            settings: settings,
          );
        }
        return PageTransition(
          child: result.first.page,
          type: PageTransitionType.fade,
          settings: settings,
        );
      }
    }
    return PageTransition(
      child: const LoginScreen(),
      type: PageTransitionType.fade,
      settings: settings,
    );
  }
}

class PageEntity {
  final String route;
  final Widget page;
  final dynamic bloc;
  const PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
