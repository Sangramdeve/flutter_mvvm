import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/core/api/api_services.dart';
import 'package:mvvm/view-model/test.dart';

import 'core/api/api_state.dart';

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
      home: Rdfgnmdf(),
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: globalMessengerKey,
    );
  }
}

class Rdfgnmdf extends StatelessWidget {
  Rdfgnmdf({super.key});
  Test test = Test();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Center(
            child: ElevatedButton(
                onPressed: () {
                  test.getData();
                },
                child: Text('data')),
          ),
        ],
      ),
    );
  }
}
