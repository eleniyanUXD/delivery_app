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
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              const SizedBox(height: 8),

              CircleAvatar(
                radius: 35, 
                backgroundImage: AssetImage(image),
              ),

              const SizedBox(height: 8),

              Text(
                name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[600],
                ),
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 6),

              Text(
                '₦$price',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(), 

              SizedBox(
                height: 36, 
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onAddToCart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.zero, 
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
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
