import 'package:e_commerce/featuers/home/domain/entities/ProductEntity.dart';
import 'package:e_commerce/featuers/sinUp/presentation/pages/singUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../featuers/home/presentation/pages/home.dart';
import '../../featuers/login/presentation/pages/login_screen.dart';
import '../../featuers/product_details/presentation/pages/productDeteailsScreen.dart';

class AppRouts {
  static const String login = "/";
  static const String sinUp = "signUP";
  static const String home = "home";
  static const String productDetails = "productDetails";
}

class Rout {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouts.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case AppRouts.sinUp:
        return MaterialPageRoute(
          builder: (context) => const SingUp(),
        );
      case AppRouts.home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
      case AppRouts.productDetails:
        return MaterialPageRoute(
            builder: (context) => ProductDetails(settings.arguments as ProductDataEntity),
            settings: RouteSettings(arguments: ProductDataEntity()));
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
