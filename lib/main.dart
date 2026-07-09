import 'package:delivery_app/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart'; // make sure path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainNavigationScreen(), // 👈 THIS MUST BE HERE
    );
  }
}
