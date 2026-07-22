import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'main_navigation_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String verificationId;
  final String destination;

  const OtpVerificationScreen({
    super.key,
    required this.verificationId,
    required this.destination,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  bool isVerifying = false;
  late String _verificationId;

  int _secondsRemaining = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _verificationId = widget.verificationId;
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (var c in _controllers) {
      c.dispose();
    }

    for (var f in _focusNodes) {
      f.dispose();
    }

    super.dispose();
  }

  bool get isOtpComplete => _controllers.every((c) => c.text.isNotEmpty);

  void verifyOTP() async {
    if (isVerifying) return;

    setState(() => isVerifying = true);

    String code = _controllers.map((c) => c.text).join();

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId,
        smsCode: code,
      );

      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        throw Exception("User not logged in");
      }

      await user.linkWithCredential(credential);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Phone verified successfully")),
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      String message = "Invalid OTP";

      if (e.code == 'invalid-verification-code') {
        message = "Wrong code";
      } else if (e.code == 'credential-already-in-use') {
        message = "Phone already in use";
      }

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    }

    if (mounted) {
      setState(() => isVerifying = false);
    }
  }

  void resendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.destination,

      verificationCompleted: (PhoneAuthCredential credential) async {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await user.linkWithCredential(credential);
        }
      },

      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.message ?? "Error")));
      },

      codeSent: (String verId, int? resendToken) {
        setState(() {
          _verificationId = verId;
        });

        startTimer();
      },

      codeAutoRetrievalTimeout: (String verId) {},
    );
  }

  void startTimer() {
    _secondsRemaining = 60;
    _canResend = false;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Code sent to ${widget.destination}'),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 40,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: const InputDecoration(counterText: ''),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 5) {
                        _focusNodes[index + 1].requestFocus();
                      } else if (value.isEmpty && index > 0) {
                        _focusNodes[index - 1].requestFocus();
                      }

                      setState(() {});
                    },
                  ),
                );
              }),
            ),

            const SizedBox(height: 20),

            TextButton(
              onPressed: _canResend ? resendOTP : null,
              child: Text(
                _canResend ? "Resend Code" : "Resend in $_secondsRemaining s",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: (isOtpComplete && !isVerifying) ? verifyOTP : null,
              child: isVerifying
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text("Verify Code"),
            ),
          ],
        ),
      ),
    );
  }
}
