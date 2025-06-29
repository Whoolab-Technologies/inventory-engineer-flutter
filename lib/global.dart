import 'package:firebase_core/firebase_core.dart';
import 'package:mvp_engineer/firebase_options.dart';
import 'package:mvp_engineer/injection/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:mvp_shared_components/core/services/storage.dart';

class AppGlobal {
  static late StorageService storageService;
  static late String? currentRoute;
  static late GlobalKey<ScaffoldState> scaffoldKey;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    storageService = await StorageService().init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    configureInjection(Environment.prod);
  }
}

typedef InputDecorationDecorator = InputDecoration Function({
  required String labelText,
  bool mandatory,
  String hintText,
  dynamic prefix,
});
