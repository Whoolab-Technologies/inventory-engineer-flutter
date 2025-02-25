import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvp_engineer/application/auth/auth_bloc.dart';
import 'package:mvp_engineer/application/login/login_bloc.dart';
import 'package:mvp_engineer/application/products/products_bloc.dart';
import 'package:mvp_engineer/global.dart';
import 'package:mvp_engineer/injection/injection.dart';
import 'package:mvp_engineer/presentations/home/home_screen.dart';
import 'package:mvp_engineer/presentations/login/login_screen.dart';
import 'package:mvp_engineer/presentations/navigator/navigator_screen.dart';
import 'package:mvp_engineer/presentations/products/products_screen.dart';
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
        // PageEntity(
        //   route: AppRoutes.REGISTER,
        //   page: const RegisterScreen(),
        //   // bloc: BlocProvider(
        //   //   create: (context) => getIt<RegisterBloc>(),
        //   // ),
        // ),
        PageEntity(
          route: AppRoutes.LOGIN,
          page: const LoginScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<LoginBloc>(),
          ),
        ),
        PageEntity(
          route: AppRoutes.HOME,
          page: const HomeScreen(),
          // bloc: BlocProvider(
          //   create: (context) => getIt<HomeBloc>(),
          // ),
        ),
        PageEntity(
          route: AppRoutes.PRODUCTS,
          page: const ProductsScreen(),
          bloc: BlocProvider(
            create: (context) => getIt<ProductsBloc>(),
          ),
        ),
        // PageEntity(
        //   route: AppRoutes.TRANSACTIONS,
        //   page: const TransactionsScreen(),
        //   // bloc: BlocProvider(
        //   //   create: (context) => getIt<RegisterBloc>(),
        //   // ),
        // ),
        // PageEntity(
        //   route: AppRoutes.REPORTS,
        //   page: const ReportsScreen(),
        //   // bloc: BlocProvider(
        //   //   create: (context) => getIt<RegisterBloc>(),
        //   // ),
        // ),
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
    log("MVP ${settings.name}");
    if (settings.name != null) {
      final result =
          AppPages.pages().where((element) => element.route == settings.name);

      if (result.isNotEmpty) {
        if (result.first.route == AppRoutes.LOGIN) {
          bool isLoggedIn = AppGlobal.storageService.isLoggedIn();
          if (isLoggedIn) {
            return PageTransition(
              child: const NavigatorScreen(),
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
