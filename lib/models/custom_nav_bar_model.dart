import 'package:flutter/material.dart';

class NavItem {
  final IconData icon;
  final String label;
  final Widget page;

  NavItem({
    required this.icon,
    required this.label,
    required this.page,
  });
}