import 'package:flutter/material.dart';
import 'package:delivery_app/models/address_model.dart';
import '../change_address_screen.dart';

class ChangeLocationCard extends StatelessWidget {
  final AddressModel address;
  final Function(AddressModel) onAddressChanged;

  const ChangeLocationCard({
    super.key,
    required this.address,
    required this.onAddressChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade400),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: Colors.black, size: 24),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Home",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    address.displayName,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(200, 90, 82, 82),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            OutlinedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeAddressScreen(),
                  ),
                );

                if (result != null && result is AddressModel) {
                  onAddressChanged(result);
                }
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                foregroundColor: Colors.green,
                side: const BorderSide(color: Colors.green, width: 1.5),
              ),
              child: const Text(
                'Change',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
