import 'package:delivery_app/home_screen.dart';
import 'package:delivery_app/main_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        print("User cancelled");
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (userCredential.user != null) {
        print("SUCCESS ✅");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MainNavigationScreen()),
        );
      }
    } catch (e) {
      print("ERROR ❌: $e");
    }
  }

  void handleSignIn() async {
    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login successful')));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
      );
    } on FirebaseAuthException catch (e) {
      print('LOGIN CODE: ${e.code}');
      print('LOGIN MESSAGE: ${e.message}');

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.code)));
    } finally {
      setState(() => isLoading = false);
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Hello, welcome back!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Sign in to continue',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 14),

              // Email field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Password field
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Remember me + Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      const Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(221, 74, 72, 72),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to Forgot Password screen
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14),

              // Sign in button
              ElevatedButton(
                onPressed: isLoading ? null : handleSignIn,
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
                    : const Text('Sign In'),
              ),
              SizedBox(height: 14),

              // divider with 'or'
              Row(
                children: const [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 14),

              // Sign in with social buttons
              Column(
                children: [
                  socialButton(
                    icon: SvgPicture.asset(
                      'assets/images/facebook.svg',
                      height: 24,
                      width: 24,
                    ),
                    text: 'Sign in with Facebook',
                    color: Colors.blue,
                    onPressed: () {},
                    iconSize: 24,
                  ),
                  const SizedBox(height: 12),
                  socialButton(
                    icon: SvgPicture.asset(
                      'assets/images/google.svg',
                      height: 24,
                      width: 24,
                    ),
                    text: 'Sign in with Google',
                    color: Colors.red,
                    onPressed: () async {
                      print("BUTTON CLICKED 🔥");
                      await signInWithGoogle();
                    },
                    iconSize: 24,
                  ),
                ],
              ),
              SizedBox(height: 80),

              // Don't have an account button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => SignupScreen()),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
