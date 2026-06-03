import 'package:flutter/material.dart';
import 'widgets/success_card.dart';
import 'widgets/app_button.dart';
import 'home_screen.dart';
import 'order_status_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SuccessCard(
            iconPath: 'assets/icons/success_icon.svg',
            title: 'Thank you!',
            subtitle: 'Your order is confirmed',
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                text: 'Track your Order',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const OrderStatusScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 16),
              AppButton(
                text: 'Go to Homepage',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomeScreen();
                      },
                    ),
                  );
                },
                isOutlined: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
