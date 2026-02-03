import 'package:flutter/material.dart';

Widget socialButton({
  required Widget icon,
  required String text,
  required Color color,
  required VoidCallback onPressed,
  double iconSize = 40,
}) {
  return SizedBox(
    width: 216,
    height: 44,
    child: OutlinedButton.icon(
      onPressed: () {},
      icon: icon,
      label: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      style: OutlinedButton.styleFrom(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),
  );
}
