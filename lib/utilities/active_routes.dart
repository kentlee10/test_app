

import 'package:flutter/material.dart';
import 'package:test_app/screens/main/home_screen.dart';
import 'package:test_app/screens/splash_screen/first_splash.dart';
import 'package:test_app/screens/splash_screen/second_splash.dart';
import 'package:test_app/screens/splash_screen/third_splash.dart';

class ActiveRoutes {
  static Map<String, Widget Function(BuildContext)> list = {
    //ALL NAMED ROUTES
    FirstSplash.routeName : (context) => const FirstSplash(),
    SecondSplash.routeName : (context) => const SecondSplash(),
    ThirdSplash.routeName : (context) => const ThirdSplash(),
    HomeScreen.routeName : (context) => const HomeScreen(),
  };
}