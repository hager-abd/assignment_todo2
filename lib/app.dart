import 'package:assignment_todo/display.dart';
import 'package:assignment_todo/to-doscreen.dart';
import 'package:flutter/material.dart';

import 'Splash.dart';
import 'homescreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "try",
      routes: {
        "/home": (context) => const HomeScreen(),
        "/todo": (context) => const ToDoScreen(),
        "/Splash": (context) => const SplashScreen(),
        "/Display": (context) => const Display(),
      },
      initialRoute: "/Splash",
    );
  }
}
