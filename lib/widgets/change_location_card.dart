import 'package:flutter/material.dart';

class ChangeLocationCard extends StatelessWidget {
  const ChangeLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade400),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: Colors.black, size: 24),

            const SizedBox(width: 12),

            // Title text and subtitle text
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Home",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Ikeja Road, Apt 112, Lagos, Nigeria",
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(200, 90, 82, 82),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // BUTTON (pushed to far right)
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                foregroundColor: Colors.green,
                side: BorderSide(color: Colors.green, width: 1.5),
              ),
              child: const Text(
                'Change',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
