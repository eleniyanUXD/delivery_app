import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum verificationMethod {sms, Email}

verificationMethod? _selectedmethod;

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() {
    return _VerificationScreenState();
  }
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Verify your account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Your account needs to be verified for you to continue',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),

            // Sms option
            InkWell(
              onTap: () {
                setState(() {
                  _selectedmethod = verificationMethod.sms;
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedmethod == verificationMethod.sms
                        ? Colors.green
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _selectedmethod == verificationMethod.sms
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/sms.svg',
                        width: 40,
                        height: 40,
                        colorFilter: ColorFilter.mode(
                          _selectedmethod == verificationMethod.sms
                              ? Colors.white
                              : Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Via SMS',
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedmethod == verificationMethod.sms
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Email option
            InkWell(
              onTap: () {
                setState(() {
                  _selectedmethod = verificationMethod.Email;
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _selectedmethod == verificationMethod.Email
                        ? Colors.green
                        : Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _selectedmethod == verificationMethod.Email
                            ? Colors.green
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/email.svg',
                        width: 40,
                        height: 40,
                        colorFilter: ColorFilter.mode(
                          _selectedmethod == verificationMethod.sms
                              ? Colors.white
                              : Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Via Email',
                      style: TextStyle(
                        fontSize: 16,
                        color: _selectedmethod == verificationMethod.Email
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),

            //Continue button
            ElevatedButton(
              onPressed: () {},
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
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
