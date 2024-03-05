import 'package:flutter/material.dart';
import 'package:time_master/src/core/routes/app_routes.dart';
import 'package:time_master/src/core/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Flutter Demo',
    );
  }
}
