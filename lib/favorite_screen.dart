import 'package:delivery_app/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'models/favorite_data.dart';
import 'widgets/dish_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Favorite',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomTabBar(controller: _controller),
          ),
        ),

        // IMPORTANT: TabBarView must match TabBar tabs
        body: TabBarView(
          controller: _controller,
          children: [
            favoriteFoods.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "No favorites yet",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: favoriteFoods.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.65,
                        ),
                    itemBuilder: (context, index) {
                      final food = favoriteFoods[index];

                      return DishCard(
                        name: food['name']!,
                        image: food['image']!,
                        price: food['price']!,

                        isFavorite: true,

                        onFavoriteToggle: () {
                          setState(() {
                            favoriteFoods.removeAt(index);
                          });
                        },

                        onAddToCart: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Added to cart")),
                          );
                        },
                      );
                    },
                  ),

            const Center(child: Text("Restaurants favorites coming soon")),
          ],
        ),
      ),
    );
  }
}
