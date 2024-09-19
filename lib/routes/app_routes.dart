import 'package:fluro/fluro.dart';

import '../modules/login/login_screen.dart';

class AppRoutes {
  static const login = '/login';

  static final router = FluroRouter();

  AppRoutes._();

  static void init() {
    router.define(
      login,
      handler: Handler(handlerFunc: (context, params) {
        return const LoginScreen();
      }),
    );
  }
}
