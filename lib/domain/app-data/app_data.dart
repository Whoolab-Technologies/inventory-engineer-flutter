import 'package:mvp_engineer/domain/auth/model/user/user.dart';

class AppData {
  AppData._();
  User? user;
  static final AppData instance = AppData._();
  static User? get storekeeper => instance.user;

  static void clear() {
    instance.user = null;
  }

  static void setUser(User user) {
    instance.user = user;
  }
}
