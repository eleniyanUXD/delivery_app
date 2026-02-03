import 'package:flutter/material.dart';
import 'package:delivery_app/onboarding_screen1.dart';

class SplashSceen extends StatefulWidget {
  const SplashSceen({super.key});
  @override
  State<SplashSceen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashSceen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return OnboardingScreen1();
          },
        ),
      );
    });
  }

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
