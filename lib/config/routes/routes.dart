import 'package:e_commerce/featuers/sinUp/presentation/pages/singUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../featuers/home/presentation/pages/home.dart';
import '../../featuers/login/presentation/pages/login_screen.dart';

class AppRouts {
  static const String login = "/";
  static const String sinUp = "signUP";
  static const String home = "home";
}

class Rout {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case AppRouts.sinUp:
        return MaterialPageRoute(
          builder: (context) => const SingUp(),
        );
      case AppRouts.home:
        return MaterialPageRoute(builder: (context) => Home(),);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text("ERROR"),
            ),
            body: unDefineRoute(),
          ),
        );
    }
  }

  static Widget unDefineRoute() {
    return const Center(
      child: Text("Undefine"),
    );
  }
}
