import 'package:delivery_app/widgets/card_input_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'OTPverification_screen.dart';
import 'main_navigation_screen.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final TextEditingController phoneController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void sendOTP() async {
    if (isLoading) return;

    String phone = phoneController.text.trim();

    if (phone.isEmpty || !RegExp(r'^\+\d{10,15}$').hasMatch(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter a valid phone number (e.g. +1234567890)"),
        ),
      );
      return;
    }

    FocusScope.of(context).unfocus();
    setState(() => isLoading = true);

    try {
      FirebaseAuth.instance.setSettings(
        appVerificationDisabledForTesting: true,
      );
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,

        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            final user = FirebaseAuth.instance.currentUser;

            if (user != null) {
              await user.linkWithCredential(credential);
            }

            if (!mounted) return;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
            );
          } catch (e) {
            debugPrint("Auto verification error: $e");
          }
        },

        verificationFailed: (FirebaseAuthException e) {
          if (!mounted) return;

          setState(() => isLoading = false);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "Verification failed")),
          );
        },

        codeSent: (String verId, int? resendToken) {
          if (!mounted) return;

          setState(() => isLoading = false);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => OtpVerificationScreen(
                verificationId: verId,
                destination: phone,
              ),
            ),
          );
        },

        codeAutoRetrievalTimeout: (String verId) {},
      );
    } catch (e) {
      if (!mounted) return;

      setState(() => isLoading = false);
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Phone Verification',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0),
        child: Column(
          children: [
            CardInputField(
              label: 'Phone Number',
              hintText: '+1234567890',
              controller: phoneController,
              keyboardType: TextInputType.phone,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
            ),
            const SizedBox(height: 20),

            // Send OTP button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : sendOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Send OTP'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
