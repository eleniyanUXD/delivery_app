import 'package:delivery_app/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkFirstTimeUser();
  }

  Future<void> checkFirstTimeUser() async {
    await Future.delayed(const Duration(seconds: 2)); // splash duration

    final prefs = await SharedPreferences.getInstance();
    bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => seenOnboarding ? SigninScreen() : OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ExpressFeast',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(178, 43, 211, 49),
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.shopping_cart_checkout_outlined,
              color: const Color.fromARGB(178, 43, 211, 49),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
