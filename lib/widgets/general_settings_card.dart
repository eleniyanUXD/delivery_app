import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralSettingsCard extends StatelessWidget {
  final String title;
  final String leftIconPath;
  final VoidCallback onTap;
  final bool isDestructive;

  const GeneralSettingsCard({
    super.key,
    required this.title,
    required this.leftIconPath,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              colorFilter: ColorFilter.mode(
                isDestructive ? Colors.red : Colors.black,
                BlendMode.srcIn,
              ),
              leftIconPath,
              height: 22,
              width: 22,
              color: Colors.black,
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isDestructive ? Colors.red : Colors.black,
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
