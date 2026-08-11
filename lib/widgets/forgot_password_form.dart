import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {
  final TextEditingController emailController;
  final VoidCallback onSubmit;
  final bool isLoading;

  const ForgotPasswordForm({
    super.key,
    required this.emailController,
    required this.onSubmit,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.grey.shade600),
            hintText: 'Enter your email',
            prefixIcon: Icon(Icons.email, color: Colors.grey.shade600),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              onSubmit();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                : const Text('Send Reset Link'),
          ),
        ),
      ],
    );
  }
}
