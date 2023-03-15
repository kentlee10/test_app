import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/screens/splash_screen/first_splash.dart';
import 'package:test_app/utilities/active_providers.dart';
import 'package:test_app/utilities/active_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ActiveProviders.list,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const FirstSplash(),
        routes: ActiveRoutes.list,
      )
    );
  }
}