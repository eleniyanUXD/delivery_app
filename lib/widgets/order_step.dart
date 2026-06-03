import 'package:flutter/material.dart';

class OrderStep extends StatelessWidget {
  final String text;
  final bool isCompleted;
  final bool isLast;

  const OrderStep({
    super.key,
    required this.text,
    this.isCompleted = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: icon + line
        Column(
          children: [
            // Circle icon
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted ? Colors.black : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : null,
            ),
            // Line
            if (!isLast)
              Container(width: 2, height: 40, color: Colors.grey[300]),
          ],
        ),
        const SizedBox(width: 12),
        // Text
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(
              text,
              style: TextStyle(
                color: isCompleted ? Colors.black : Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
