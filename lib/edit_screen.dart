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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit ${widget.title}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: widget.title,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
