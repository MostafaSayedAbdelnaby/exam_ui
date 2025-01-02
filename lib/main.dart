import 'package:exam_ui/task2/second_home_screen.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SecondHomeScreen.routeName: (context) => SecondHomeScreen(),
      },
      initialRoute:
      SecondHomeScreen.routeName,
      // HomeScreen.routeName,
    );
  }
}
