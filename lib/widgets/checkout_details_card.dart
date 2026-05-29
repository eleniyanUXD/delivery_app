import 'package:flutter/material.dart';

class CheckoutDetailsCard extends StatelessWidget {
  final String text;
  final IconData leftIcon;
  final Widget rightIcon;
  final bool isSelected;
  final VoidCallback? onTap;

  const CheckoutDetailsCard({
    super.key,
    required this.text,
    required this.leftIcon,
    required this.rightIcon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Row(
            children: [
              Icon(
                leftIcon,
                color: isSelected ? Colors.green : Colors.grey.shade400,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? Colors.black : Colors.grey.shade500,
                  ),
                ),
              ),
              rightIcon,
            ],
          ),
        ),
      ),
    );
  }
}
