import 'package:flutter/material.dart';
import 'widgets/card_input_field.dart';
import 'widgets/scan_card_button.dart';
import 'widgets/check_box_field.dart';
import 'widgets/app_button.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({super.key});

  @override
  State<PaymentDetailScreen> createState() {
    return _PaymentDetailScreenState();
  }
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  final cardNumberController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();
  bool isSaved = false;

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment Details',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardInputField(
              label: 'Card Number',
              hintText: '1234 5678 9012 3456',
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
            ),

            const SizedBox(height: 28),

            Row(
              children: [
                Expanded(
                  child: CardInputField(
                    label: 'Expiry Date',
                    hintText: 'MM/YY',
                    controller: expiryDateController,
                    keyboardType: TextInputType.datetime,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                  ),
                ),

                const SizedBox(width: 24),

                Expanded(
                  child: CardInputField(
                    label: 'CVV',
                    hintText: '123',
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Scan card button
            ScanCardButton(
              text: 'Scan Card',
              onTap: () {
                // Handle scan card action
              },
              icon: 'assets/icons/scan_icon.svg',
            ),

            const SizedBox(height: 12),

            // Save my card details checkbox
            CheckBoxField(
              value: isSaved,
              onChanged: (value) {
                setState(() {
                  isSaved = value ?? false;
                });
              },
              text: 'Save my card details',
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(text: 'Pay Now', onTap: () {}),
              SizedBox(height: 16),
              AppButton(text: 'Cancel', onTap: () {}, isOutlined: true),
            ],
          ),
        ),
      ),
    );
  }
}
