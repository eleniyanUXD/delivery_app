import 'package:flutter/material.dart';
import 'widgets/forgot_password_form.dart';
import 'models/forgot_password_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final forgotPasswordModel = ForgotPasswordModel();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    if (emailController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter your email')));
      return;
    }

    setState(() {
      isLoading = true;
    });

    forgotPasswordModel.email = emailController.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: forgotPasswordModel.email,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset email sent!')),
      );

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      String message = 'Something went wrong';

      if (e.code == 'invalid-email') {
        message = 'Please enter a valid email address';
      } else if (e.code == 'user-not-found') {
        message = 'No account found with this email';
      }

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Enter your email address to reset your password.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 116, 113, 113),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            ForgotPasswordForm(
              emailController: emailController,
              onSubmit: resetPassword,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
