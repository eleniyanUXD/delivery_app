import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/category_model.dart';
import 'package:delivery_app/widgets/dish_card.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_search_bar.dart';
import 'models/featured_resturant_model.dart';
import 'models/dish_model.dart';
import 'package:delivery_app/cart_item.dart';
import 'package:delivery_app/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  List<CategoryModel> categories = [];
  List<FeaturedResturantModel> featuredRestaurant = [];
  List<CartItem> cart = [];
  List<DishModel> dishes = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getFeaturedRestaurant() {
    featuredRestaurant = FeaturedResturantModel.getFeaturedRestaurant();
  }

  @override
  void initState() {
    super.initState();
    _getCategories();
    _getFeaturedRestaurant();
    dishes = DishModel.getDishes();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low, // 👈 improves performance
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.notifications),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Search bar
            CustomSearchBar(
              controller: searchController,
              hintText: 'Search food restaurants',
              cart: cart, // ✅ PASS CART HERE
            ),
            SizedBox(height: 16),

            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/banner.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.fitWidth, // 👈 better for banners
                filterQuality: FilterQuality.low, // 👈 performance boost
              ),
            ),

            SizedBox(height: 16),

            // Category
            Text(
              'Categories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 12),
            Container(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 16),
                separatorBuilder: (context, index) => SizedBox(width: 20),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(categories[index].imagePath),
                          ),
                        ),

                        SizedBox(height: 4),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 16),

            // Featured restaurant
            Text(
              'Featured restaurant',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),

            SizedBox(height: 12),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 16),
                separatorBuilder: (context, index) => (SizedBox(width: 12)),
                itemCount: featuredRestaurant.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              featuredRestaurant[index].imagePath,
                            ),
                          ),
                        ),

                        SizedBox(height: 4),
                        Text(
                          featuredRestaurant[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            // Popular food
            Text(
              'Popular food',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dishes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
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
                      ); // ADD TO CART
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${dish.name} added to cart!')),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
