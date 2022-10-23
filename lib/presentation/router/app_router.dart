import 'package:flutter/material.dart';
import 'package:magdsoft/presentation/screens/user/login_screen.dart';
import 'package:magdsoft/presentation/screens/user/verify_screen.dart';
import 'package:magdsoft/presentation/screens/shared/help_screen.dart';
import 'package:magdsoft/presentation/screens/shared/home_screen.dart';
import 'package:magdsoft/presentation/screens/shared/main_screen.dart';
import 'package:magdsoft/presentation/screens/shared/product_details.dart';
import 'package:magdsoft/presentation/screens/splash_screen.dart';


class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String verifyScreen = "/verifyScreen";
  static const String mainScreen = "/main";
  static const String helpScreen = "/helpScreen";
  static const String onBoardingRoute = "/onBoarding";
  static const String homeRoute = "/home";
  static const String productDetailsRoute = "/productDetails";
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.verifyScreen:
        return MaterialPageRoute(builder: (_) => VerifyScreen());
      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => MainScreen());
        case Routes.helpScreen:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.productDetailsRoute:
        return MaterialPageRoute(builder: (_) => ProductDetails());
      default:
        return null;
    }
  }
}
