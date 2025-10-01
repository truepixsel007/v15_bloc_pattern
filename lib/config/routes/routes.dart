import 'package:flutter/material.dart';
// import 'package:v15/config/routes/routes_name.dart';
import 'package:v15_bloc_pattern/config/routes/routes_name.dart';
import '../../views/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(body: Center(child: Text('No Route Found')));
          },
        );
    }
  }
}
