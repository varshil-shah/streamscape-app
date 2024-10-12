import 'package:flutter/material.dart';
import 'package:streamscape/screens/home_screen.dart';
import 'package:streamscape/screens/search_screen.dart';
import 'package:streamscape/screens/signin_screen.dart';
import 'package:streamscape/screens/signup_screen.dart';
import 'package:streamscape/screens/splash_screen.dart';

class Routes {
  static const String initial = "/";
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String home = '/home';
  static const String search = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case search:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
