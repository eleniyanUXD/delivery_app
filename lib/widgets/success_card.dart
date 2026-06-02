import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const SuccessCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, width: 100, height: 100),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
