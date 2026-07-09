import 'package:delivery_app/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/widgets/food_card.dart';
import 'widgets/cart_summary.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cart;

  const CartScreen({super.key, required this.cart});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  double deliveryFee = 2.0;
  double getSubTotal() {
    return getTotalPrice();
  }

  double getTotal() {
    return getSubTotal() + deliveryFee;
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in widget.cart) {
      total += (item.price as num) * (item.quantity as num);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      // Body
      body: widget.cart.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty 🛒",
                style: TextStyle(fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      final CartItem cartItem = widget.cart[index];

                      return FoodCard(
                        key: ValueKey(cartItem.id),
                        title: cartItem.title,
                        subtitle: cartItem.subtitle,
                        price: cartItem.price,
                        image: cartItem.image,
                        quantity: cartItem.quantity,

                        onAdd: () {
                          setState(() {
                            cartItem.quantity++;
                          });
                        },

                        onRemove: () {
                          setState(() {
                            if (cartItem.quantity > 1) {
                              cartItem.quantity--;
                            }
                          });
                        },

                        onDelete: () {
                          setState(() {
                            widget.cart.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
                ),

                CartSummary(
                  subtotal: getSubTotal(),
                  deliveryFee: deliveryFee,
                  buttonText: "Proceed to Checkout",
                  onCheckout: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CheckoutScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
    );
  }
}
