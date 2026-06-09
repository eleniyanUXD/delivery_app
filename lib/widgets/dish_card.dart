import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCart; // 👈 NEW

  const DishCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onAddToCart, // 👈
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 12),

              CircleAvatar(radius: 40, backgroundImage: AssetImage(image)),

              const SizedBox(height: 12),

              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 8),

              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              //  ADD TO CART BUTTON (BACK)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ❤️ Favorite icon
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: onFavoriteToggle,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
