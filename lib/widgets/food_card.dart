import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onDelete;

  const FoodCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(image, width: 70, height: 70, fit: BoxFit.cover),
          ),

          const SizedBox(width: 12),

          // Text + controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                // THIS is where _qtyButton belongs
                Row(
                  children: [
                    _qtyButton(Icons.remove, onRemove, size: 18),

                    const SizedBox(width: 6),

                    Text(
                      quantity.toString().padLeft(2, '0'),
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(width: 6),

                    _qtyButton(Icons.add, onAdd, size: 16),

                    const Spacer(),

                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Delete button
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable button
  Widget _qtyButton(IconData icon, VoidCallback onTap, {double size = 16}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Icon(icon, color: Colors.green, size: size),
      ),
    );
  }
}
