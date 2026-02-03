import 'package:flutter/material.dart';
import 'package:delivery_app/onboarding_screen3.dart';

class OnboardingScreen2 extends StatefulWidget {
  const OnboardingScreen2({super.key});
  @override
  State<OnboardingScreen2> createState() {
    return _OnboardingScreen2State();
  }
}

class _OnboardingScreen2State extends State<OnboardingScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(padding: const EdgeInsets.only(right: 16.0)),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/image2.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Real-time updates',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 14),
              Text(
                'Curious  about the status of your order? Relax! We provide real-time updates on your delivery so you can track its progress from our kitchen to you',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 28),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OnboardingScreen3();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(178, 43, 211, 49),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
