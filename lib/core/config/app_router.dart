import 'package:flutter/material.dart';
import 'package:restaurant/features/auth/login/login_screen.dart';
import 'package:restaurant/features/auth/login/reset_password_page.dart';
import 'package:restaurant/features/auth/registration/registration_screen.dart';
import 'package:restaurant/features/pages/home/home_view.dart';
import 'package:restaurant/features/pages/home/widgets/categoryDetails_widget.dart';
import 'package:restaurant/features/splash_screen/splash_screen.dart';
import '../../features/pages/layout_view.dart';
import 'page_routes_name.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
      case PageRoutesName.layout:
        return MaterialPageRoute(
            builder: (context) => const LayOutView(), settings: settings);
      case PageRoutesName.home:
        return MaterialPageRoute(
            builder: (context) => const HomePageView(), settings: settings);
      case PageRoutesName.login:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(), settings: settings);
      case PageRoutesName.register:
        return MaterialPageRoute(
            builder: (context) => const RegistrationScreen(), settings: settings);
      case PageRoutesName.resetPassword:
        return MaterialPageRoute(
            builder: (context) =>  ResetPasswordPage(), settings: settings);
      case PageRoutesName.categoryDetails:
        return MaterialPageRoute(
            builder: (context) =>  const CategoryDataDetails(), settings: settings);


      default:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen(), settings: settings);
    }
  }
}
