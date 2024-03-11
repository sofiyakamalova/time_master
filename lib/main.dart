import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:time_master/src/core/routes/app_router.dart';
import 'package:time_master/src/features/planner/provider/event_provider.dart';

Future<void> main() async {
  //hive initalization
  await Hive.initFlutter();
  // open the box
  var box = await Hive.openBox('my_events');
  runApp(
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(),
    );
  }
}
