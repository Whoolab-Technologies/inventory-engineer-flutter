import "package:flutter/material.dart";

class AppContext {
  AppContext._();
  static final AppContext instance = AppContext._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> getNavigatorKey() => navigatorKey;
}
