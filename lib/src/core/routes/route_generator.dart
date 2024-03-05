import 'package:flutter/material.dart';
import 'package:time_master/src/core/routes/app_routes.dart';
import 'package:time_master/src/feautures/home_page.dart';

class RouteGenerator {
  static Route<Object?>? generateRoute(RouteSettings settings) {
    final routeName = settings.name;

    switch (routeName) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        );
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute buildRoute(Widget child,
      {required RouteSettings settings}) {
    return MaterialPageRoute(
        settings: settings, builder: (BuildContext context) => child);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: const Text(
              'ERROR!!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: const Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 450.0,
                    width: 450.0,
                  ),
                  Text(
                    'Seems the route you\'ve navigated to doesn\'t exist!!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
