import 'package:flutter/material.dart';
import 'package:mvvm/core/routing/app_router.dart';
import 'package:mvvm/core/routing/app_routes.dart';

GlobalKey<ScaffoldMessengerState> globalMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: RoutesName.loginScreen,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: globalMessengerKey,
    );
  }
}
