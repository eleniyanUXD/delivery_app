import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() {
    return _RestaurantScreenState();
  }
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  bool isFavoritew = false;
  int selectedIndex = 0;
  final List<String> tabs = ['Trending', 'Pizza', 'Drinks'];
  Set<int> favorites = {};

  final List<Map<String, String>> _trending = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavoritew = !isFavoritew;
              });
            },
            icon: Icon(
              isFavoritew ? Icons.favorite : Icons.favorite,
              color: isFavoritew ? Colors.red : Colors.grey,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/mcdonaldd.png'),
                  ),
                ),
                SizedBox(height: 12),

                // Restaurant name
                Text(
                  'McDonald',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 6),

                // Restuarant rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    Text(
                      '5.0',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
                SizedBox(height: 12),

                // Resturant opening time
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(118, 207, 207, 207),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Opens at 8:30 am - Closes at 10:30 pm',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),

                // Tabs
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(tabs.length, (index) {
                    bool isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: IntrinsicWidth(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tabs[index],
                              style: TextStyle(
                                color: isSelected ? Colors.green : Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 6),

                            // Underline for selected tab
                            Container(
                              height: 3,
                              width: 40,
                              color: isSelected
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 12),

                // Trending dishes grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _trending.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final food = _trending[index];
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
        ],
      ),
    );
  }
}
