import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  final String name;

  const ChatAvatar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Text(name[0]));
  }
}
