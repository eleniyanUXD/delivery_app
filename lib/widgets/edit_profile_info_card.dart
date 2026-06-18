import 'package:flutter/material.dart';

class EditProfileInfoCard extends StatelessWidget {
  final String name;
  final String number;
  final String email;
  final String imagePath;
  final VoidCallback onEditNumber;
  final VoidCallback onEditEmail;

  const EditProfileInfoCard({
    super.key,
    required this.name,
    required this.number,
    required this.email,
    required this.imagePath,
    required this.onEditNumber,
    required this.onEditEmail,
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
            CircleAvatar(radius: 35, backgroundImage: AssetImage(imagePath)),

            const SizedBox(width: 12),

            // Name, phonu number & email
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        number,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(206, 112, 100, 100),
                        ),
                      ),

                      InkWell(
                        onTap: onEditNumber,
                        child: const Icon(
                          Icons.edit,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        email,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(206, 112, 100, 100),
                        ),
                      ),

                      InkWell(
                        onTap: onEditEmail,
                        child: const Icon(
                          Icons.edit,
                          size: 18,
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
