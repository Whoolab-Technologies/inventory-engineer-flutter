import 'package:injectable/injectable.dart';
import 'package:mvp_engineer/domain/app-data/app_data.dart';
import 'package:mvp_engineer/infrastructure/core/dio.dart';

@module
abstract class InjectionModule {
  // @lazySingleton
  // FirebaseFirestore get firestore => FirebaseFirestore.instance;
  // @lazySingleton
  // FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  // @lazySingleton
  // FirebaseStorage get storage => FirebaseStorage.instance;

  @lazySingleton
  AppData get appData => AppData.instance;
  @lazySingleton
  DioClient get dioClient => DioClient.instance;
}
