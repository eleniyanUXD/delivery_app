import 'package:flutter/material.dart';
import 'dart:async';

enum VerificationMethod { sms, email }

class OtpVerificationScreen extends StatefulWidget {
  final VerificationMethod method;
  final String destination;

  const OtpVerificationScreen({
    super.key,
    required this.method,
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

  // Timer for OTP expiration and resend logic
  int _secondsRemaining = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  bool get isOtpComplete => _controllers.every((c) => c.text.isNotEmpty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Enter the OTP sent to your phone number',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),

            Text('We have sent a code to ${widget.destination}'),
            const SizedBox(height: 16),

            // OTP input fields
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
                    decoration: InputDecoration(
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                    ),
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
            SizedBox(height: 12),

            // Resend OTP logic
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _canResend
                      ? () {
                          startTimer();
                        }
                      : null,
                  child: Text(
                    _canResend
                        ? 'Resend OTP'
                        : 'Resend in $_secondsRemaining seconds',
                    style: TextStyle(
                      color: _canResend ? Colors.green : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            //Verify Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(178, 43, 211, 49),
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
              child: const Text('Verify code'),
            ),
          ],
        ),
      ),
    );
  }
}
