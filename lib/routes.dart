import 'package:flutter/material.dart';
import 'package:streamscape/screens/home_screen.dart';
import 'package:streamscape/screens/signin_screen.dart';
import 'package:streamscape/screens/signup_screen.dart';

class Routes {
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case signin:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
