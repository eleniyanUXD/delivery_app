import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralSettingsCard extends StatelessWidget {
  final String title;
  final String leftIconPath;
  final VoidCallback onTap;

  const GeneralSettingsCard({
    super.key,
    required this.title,
    required this.leftIconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              leftIconPath,
              height: 22,
              width: 22,
              color: Colors.black,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const Icon(Icons.chevron_right, color: Colors.black, size: 22),
          ],
        ),
      ),
    );
  }
}
