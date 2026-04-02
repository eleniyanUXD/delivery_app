import 'package:flutter/material.dart';

class Food {
  String name;
  int quantity;

  Food({required this.name, this.quantity = 1});
}

class Drink {
  String name;
  double price;
  bool selected;
  int quantity;

  Drink({
    required this.name,
    required this.price,
    this.selected = false,
    this.quantity = 1,
  });
}

class FoodDetailsScreen extends StatefulWidget {
  const FoodDetailsScreen({super.key});

  @override
  State<FoodDetailsScreen> createState() {
    return _FoodDetailsScreenState();
  }
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  Food shawarma = Food(name: 'Shawarma');

  Widget buildShawarmaQuantity() {
    return Row(
      children: [
        // MINUS BUTTON
        GestureDetector(
          onTap: () {
            setState(() {
              if (shawarma.quantity > 1) shawarma.quantity--;
            });
          },
          child: Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.remove, size: 18, color: Colors.green),
          ),
        ),
        const SizedBox(width: 8),

        // QUANTITY TEXT
        Text(
          shawarma.quantity.toString().padLeft(2, '0'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),

        // PLUS BUTTON
        GestureDetector(
          onTap: () {
            setState(() {
              shawarma.quantity++;
            });
          },
          child: Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.add, size: 18, color: Colors.green),
          ),
        ),
      ],
    );
  }

  Widget buildBtn(Drink drink) {
    return Row(
      children: [
        // MINUS BUTTON
        GestureDetector(
          onTap: () {
            setState(() {
              if (drink.quantity > 1) drink.quantity--;
            });
          },
          child: Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.remove, size: 18, color: Colors.green),
          ),
        ),

        const SizedBox(width: 8),

        // QUANTITY TEXT
        Text(
          drink.quantity.toString().padLeft(2, '0'),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),

        const SizedBox(width: 8),

        // PLUS BUTTON
        GestureDetector(
          onTap: () {
            setState(() {
              drink.quantity++;
            });
          },
          child: Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(Icons.add, size: 18, color: Colors.green),
          ),
        ),
      ],
    );
  }

  List<Drink> drinks = [
    Drink(name: 'Coke', price: 10.0, selected: true, quantity: 2),
    Drink(name: 'Water', price: 10.0, selected: true, quantity: 0),
    Drink(name: 'Peosi cola', price: 10.0, selected: true, quantity: 2),
  ];

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 30),
          child: Column(
            children: [
              Image.asset(
                'assets/images/fooddetail.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 16),

              //Food name and quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shawarma.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  buildShawarmaQuantity(),
                ],
              ),
              SizedBox(height: 16),

              // Food description
              Text(
                'Indulge in the rich flavors and aromatic spices of our signature Shawarma, crafted to perfection by our skilled chefs. Each bite is a symphony of tastes, combining tender, marinated meat (choose from succulent chicken, flavorful beef, or delectable lamb) with a medley of fresh vegetables, all wrapped in a warm, soft flatbread',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 20),

              // Add a drink section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading
                    Text(
                      'Add a drink',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Drinks list
                    ...drinks.map((drink) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            // Checkbox
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Checkbox(
                                value: drink.selected,
                                activeColor: Colors.green,
                                onChanged: (value) {
                                  setState(() {
                                    drink.selected = value!;
                                  });
                                },
                              ),
                            ),

                            SizedBox(width: 8),

                            // Drink name
                            Text(drink.name, style: TextStyle(fontSize: 16)),

                            Spacer(),
                            // Quantity selector
                            if (drink.selected) buildBtn(drink),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),

              SizedBox(height: 29),

              // Delivery time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery time',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Row(
                    children: [
                      Icon(Icons.access_time, size: 24),
                      SizedBox(width: 4),
                      Text(
                        '20 - 30 mins',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Total price and add to cart button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '\$30.00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  // Ass to cart button
                  ElevatedButton(
                    onPressed: () {
                      //....
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
