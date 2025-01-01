import 'package:flutter/material.dart';
import 'package:mvvm/view/auth/signup/sign_up.dart';

import '../../view/auth/login/login.dart';
import 'app_router.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) =>   Login());
      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (context) =>  const SignUp());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
              body: Center(
                child: Text('No routes found'),
              ),
            ));
    }
  }
}