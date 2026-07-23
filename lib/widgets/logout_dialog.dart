import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'Logout',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
      ),
      content: const Text(
        'Are you sure you want to log out?',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.zero, // remove default spacing
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey[800]),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    await AuthService.logout(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Logout', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
