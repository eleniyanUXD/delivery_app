import 'package:flutter/material.dart';

class DishCard extends StatelessWidget {
  final String name;
  final String image;
  final String price;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCart;

  const DishCard({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10), // 🔽 slightly reduced
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 6),

              // 🔥 OPTIMIZED IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  cacheWidth: 150, // 🔥 HUGE performance boost
                ),
              ),

              const SizedBox(height: 8),

              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 6),

              Text(
                '₦$price',
                style: const TextStyle(
                  fontSize: 16, // 🔽 slightly reduced
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              SizedBox(
                height: 34,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.zero,
                    elevation: 0, // 🔥 reduces GPU work
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
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
              splashRadius: 18, // 🔥 smaller = lighter
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 20,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
