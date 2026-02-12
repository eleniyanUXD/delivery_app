import 'package:delivery_app/OTPverification_screen.dart';
import 'package:delivery_app/forgotpassword_password.dart';
import 'package:delivery_app/onboarding_screen1.dart';
import 'package:delivery_app/signup_screen.dart';
import 'package:delivery_app/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/splash_screen.dart';
import 'package:delivery_app/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordScreen()
      );
  }
}
