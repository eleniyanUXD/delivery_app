import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double deliveryFee;
  final VoidCallback onCheckout;
  final String buttonText;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.deliveryFee,
    required this.onCheckout,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    double total = subtotal + deliveryFee;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow("Selected item", "\$${subtotal.toStringAsFixed(2)}"),
          const SizedBox(height: 8),
          _buildRow(
            "Delivery & handling",
            "\$${deliveryFee.toStringAsFixed(2)}",
          ),
          const SizedBox(height: 12),

          const Divider(),

          const SizedBox(height: 12),

          _buildRow("Subtotal", "\$${total.toStringAsFixed(2)}", isBold: true),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String title,
    String value, {
    bool isBold = false,
    double fontSize = 15,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
