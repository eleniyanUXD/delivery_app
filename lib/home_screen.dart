import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  Set<int> favorites = {};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> _categories = [
    {'name': 'Shawarma', 'image': 'assets/images/shawarma.png'},
    {'name': 'Pizza', 'image': 'assets/images/pizza.png'},
    {'name': 'Jollof Rice', 'image': 'assets/images/jollof rice.png'},
    {'name': 'Drinks', 'image': 'assets/images/drinks.png'},
    {'name': 'White Rice', 'image': 'assets/images/white rice.png'},
    {'name': 'Spaghetti', 'image': 'assets/images/spaghetti.png'},
  ];

  final List<Map<String, String>> _featuredRestaurants = [
    {'name': 'Terra', 'image': 'assets/images/terra.png'},
    {'name': 'McDonald', 'image': 'assets/images/McDonald.png'},
    {'name': 'KFC', 'image': 'assets/images/KFC.png'},
    {'name': 'Chillox', 'image': 'assets/images/chillox.png'},
    {'name': 'Yakoyo', 'image': 'assets/images/yakoyo.png'},
    {'name': 'Chicken Republic', 'image': 'assets/images/chicken.png'},
  ];

  final List<Map<String, String>> _popularFood = [
    {
      'name': 'Shawarma',
      'image': 'assets/images/shawarma.png',
      'price': '\$7.00',
    },
    {'name': 'Pizza', 'image': 'assets/images/pizza.png', 'price': '\$12.00'},
    {
      'name': 'Hamburger',
      'image': 'assets/images/hamburger.png',
      'price': '\$12.00',
    },
    {
      'name': 'Vegetable',
      'image': 'assets/images/vegetable.png',
      'price': '\$6.00',
    },
    {
      'name': 'Seafood Okro',
      'image': 'assets/images/seafoodokro.png',
      'price': '\$4.00',
    },
    {
      'name': 'Chicken',
      'image': 'assets/images/chickenn.png',
      'price': '\$12.00',
    },
    {'name': 'Pasta', 'image': 'assets/images/pasta.png', 'price': '\$8.00'},
    {
      'name': 'Chicken Salad',
      'image': 'assets/images/chickensalad.png',
      'price': '\$13.00',
    },
    {'name': 'Moi-Moi', 'image': 'assets/images/moimoi.png', 'price': '\$2.00'},
    {
      'name': 'Spicy Noodles',
      'image': 'assets/images/spicynoodles.png',
      'price': '\$7.00',
    },
    {
      'name': 'Beef Salad',
      'image': 'assets/images/beefsalad.png',
      'price': '\$8.00',
    },
    {
      'name': 'Egg Pizza',
      'image': 'assets/images/eggpizza.png',
      'price': '\$5.00',
    },
    {
      'name': 'Pepper Soup',
      'image': 'assets/images/peppersoup.png',
      'price': '\$11.00',
    },
    {
      'name': 'Jollof Rice',
      'image': 'assets/images/jollofrice.png',
      'price': '\$9.00',
    },
  ];

  Widget dishCard({
    required int index,
    required String name,
    required String image,
    required String price,
  }) {
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

              // Dish name
              Text(
                name,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 8),

              // Price
              Text(
                price,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),

              // Add to cart button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          // Fvaorite icon
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  if (favorites.contains(index)) {
                    favorites.remove(index);
                  } else {
                    favorites.add(index);
                  }
                });
              },
              icon: Icon(
                favorites.contains(index)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: favorites.contains(index) ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Home')),
    Center(child: Text('Chat')),
    Center(child: Text('Favorite')),
    Center(child: Text('Profile')),
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredCategories = _categories.where((c) {
      return c['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    final filteredRestaurants = _featuredRestaurants.where((r) {
      return r['name']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 50, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// HEADER
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/avatar.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Welcome Back",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Fuad",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications,
                            color: Colors.green,
                            size: 28,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// SEARCH BAR
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {
                                query = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: "Search for food or restaurant",
                              prefixIcon: const Icon(Icons.search),
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 0.5,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 20),

                        // Add to cart icon
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey, width: 0.5),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// BANNER
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        "assets/images/banner.png",
                        height: 134,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// FEATURED RESTAURANTS
                    Row(
                      children: [
                        const Text(
                          "Featured Restaurants",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See all",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredRestaurants.length,
                        itemBuilder: (context, index) {
                          final restaurant = filteredRestaurants[index];

                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Container(
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /// BOX IMAGE (NOT CIRCLE)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      restaurant['image']!,
                                      width: 56,
                                      height: 56,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    restaurant['name']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// CATEGORIES HEADER
                    Row(
                      children: [
                        const Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "See all",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// CATEGORIES LIST
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredCategories.length,
                        itemBuilder: (context, index) {
                          final category = filteredCategories[index];

                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Container(
                              width: 80,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  /// BOX IMAGE
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      category['image']!,
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    category['name']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          'Popular Food',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    //Dish cards
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _popularFood.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.65,
                          ),
                      itemBuilder: (context, index) {
                        final food = _popularFood[index];
                        return dishCard(
                          index: index,
                          name: food['name']!,
                          image: food['image']!,
                          price: food['price']!,
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          : _pages[_selectedIndex],

      //Bottom nav bar
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: Colors.green);
            }
            return const IconThemeData(
              color: Color.fromARGB(255, 185, 181, 181),
            );
          }),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(color: Colors.green);
            }
            return const TextStyle(color: Colors.grey);
          }),
        ),
        child: NavigationBar(
          height: 80,
          selectedIndex: _selectedIndex,

          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },

          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),

            NavigationDestination(
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat),
              label: 'Chat',
            ),

            NavigationDestination(
              icon: Icon(Icons.favorite_outlined),
              selectedIcon: Icon(Icons.favorite),
              label: 'Favorite',
            ),

            NavigationDestination(
              icon: Icon(Icons.account_circle_outlined),
              selectedIcon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
