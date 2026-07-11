import 'package:flutter/material.dart';
import 'package:delivery_app/widgets/dish_card.dart';
import 'package:delivery_app/widgets/custom_search_bar.dart';
import 'package:delivery_app/models/category_model.dart';
import 'package:delivery_app/models/featured_resturant_model.dart';
import 'package:delivery_app/models/dish_model.dart';
import 'package:delivery_app/cart_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  List<CategoryModel> categories = [];
  List<FeaturedResturantModel> featuredRestaurant = [];
  List<CartItem> cart = [];
  List<DishModel> dishes = [];

  @override
  void initState() {
    super.initState();
    categories = CategoryModel.getCategories();
    featuredRestaurant = FeaturedResturantModel.getFeaturedRestaurant();
    dishes = DishModel.getDishes();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 🔹 HEADER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      'assets/images/avatar.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      cacheWidth: 120,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text('Eleniyan', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 SEARCH BAR
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomSearchBar(
                controller: searchController,
                hintText: 'Search food restaurants',
                cart: cart,
              ),
            ),
          ),

          // 🔹 BANNER
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/banner.png',
                  height: 150,
                  fit: BoxFit.contain,
                  cacheWidth: 600,
                ),
              ),
            ),
          ),

          // 🔹 CATEGORIES TITLE
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // 🔹 CATEGORIES LIST
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  final category = categories[index];

                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: category.boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              category.imagePath,
                              cacheWidth: 80,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          category.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // 🔹 FEATURED TITLE
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Featured restaurant',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // 🔹 FEATURED LIST
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: featuredRestaurant.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final restaurant = featuredRestaurant[index];

                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset(
                            restaurant.imagePath,
                            cacheWidth: 100,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          restaurant.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 16)),

          // 🔹 POPULAR TITLE
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Popular food',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // 🔥 GRID (MAIN FIX)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final dish = dishes[index];

                return DishCard(
                  name: dish.name,
                  image: dish.imagePath,
                  price: dish.price.toString(),
                  isFavorite: dish.isFavorite,
                  onFavoriteToggle: () {
                    setState(() {
                      dish.isFavorite = !dish.isFavorite;
                    });
                  },
                  onAddToCart: () {
                    setState(() {
                      cart.add(
                        CartItem(
                          id: index,
                          title: dish.name,
                          subtitle: 'Delicious food',
                          price: dish.price.toDouble(),
                          image: dish.imagePath,
                          quantity: 1,
                        ),
                      );
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${dish.name} added to cart!')),
                    );
                  },
                );
              }, childCount: dishes.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
