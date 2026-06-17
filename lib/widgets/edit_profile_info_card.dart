import 'package:flutter/material.dart';

class EditProfileInfoCard extends StatelessWidget {
  final String name;
  final String number;
  final String email;
  final String imagePath;
  final VoidCallback onTap;

  const EditProfileInfoCard({
    super.key,
    required this.name,
    required this.number,
    required this.email,
    required this.imagePath,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.grey, width: 0.5),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),

            const SizedBox(width: 12),

            // Name, phonu number & email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          number,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(206, 112, 100, 100),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      GestureDetector(
                        onTap: onTap,
                        child: const Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          email,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(206, 112, 100, 100),
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      GestureDetector(
                        onTap: onTap,
                        child: const Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
