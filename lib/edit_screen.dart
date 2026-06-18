import 'package:delivery_app/widgets/app_button.dart';
import 'package:flutter/material.dart';

class EditFieldScreen extends StatefulWidget {
  final String title;
  final String initialValue;

  const EditFieldScreen({
    super.key,
    required this.title,
    required this.initialValue,
  });

  @override
  State<EditFieldScreen> createState() => _EditFieldScreenState();
}

class _EditFieldScreenState extends State<EditFieldScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit ${widget.title}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 30),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: widget.title,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                // When not active
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade400, width: 2),
                ),

                // When active
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),

                // Default label style
                labelStyle: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 14,
                ),

                // Label style when active
                floatingLabelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 24),
            AppButton(
              text: 'Save',
              onTap: () {
                Navigator.pop(context, controller.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
