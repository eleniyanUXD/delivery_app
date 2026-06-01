import 'package:flutter/material.dart';

class CardInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry contentPadding;

  const CardInputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16),
        ),

        // When not active
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
        ),

        // When active
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),

        // Default label style
        labelStyle: TextStyle(color: Colors.grey.shade900, fontSize: 14),

        // Label style when active
        floatingLabelStyle: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
