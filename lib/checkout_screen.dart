import 'package:delivery_app/widgets/add_new_card_button.dart';
import 'package:delivery_app/widgets/change_location_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/checkout_details_card.dart';
import 'widgets/cart_summary.dart';
import 'cart_data.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() {
    return _CheckoutScreenState();
  }
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  int selectedPaymentIndex = 0;

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
    for (var item in cartItems) {
      total += (item.price as num) * (item.quantity as num);
    }
    return total;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      // body
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        children: [
          ChangeLocationCard(), const SizedBox(height: 22),

          // checkout detals options
          Text(
            'Payment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          CheckoutDetailsCard(
            text: '50611 ******* 1234',
            leftIcon: Icons.check_circle,
            rightIcon: SvgPicture.asset(
              'assets/icons/mastercard_icon.svg',
              width: 24,
              height: 24,
            ),
            isSelected: selectedPaymentIndex == 0,
            onTap: () {
              setState(() {
                selectedPaymentIndex = 0;
              });
            },
          ),

          const SizedBox(height: 12),

          CheckoutDetailsCard(
            text: '6534 ******* 4321',
            leftIcon: Icons.check_circle,
            rightIcon: SvgPicture.asset(
              'assets/icons/visa_icon.svg',
              width: 24,
              height: 24,
            ),
            isSelected: selectedPaymentIndex == 1,
            onTap: () {
              setState(() {
                selectedPaymentIndex = 1;
              });
            },
          ),

          const SizedBox(height: 12),

          CheckoutDetailsCard(
            text: '3566 ******* 5678',
            leftIcon: Icons.check_circle,
            rightIcon: SvgPicture.asset(
              'assets/icons/paypal_icon.svg',
              width: 24,
              height: 24,
            ),
            isSelected: selectedPaymentIndex == 2,
            onTap: () {
              setState(() {
                selectedPaymentIndex = 2;
              });
            },
          ),

          const SizedBox(height: 16),

          // Add new card button
          Center(
            child: AddNewCardButton(
              text: 'Add new card',
              onTap: () {},
              icon: Icons.add,
            ),
          ),
        ],
      ),

      // Cart sumaary + Checkout button
      bottomNavigationBar: CartSummary(
        subtotal: getSubTotal(),
        deliveryFee: deliveryFee,
        buttonText: 'Confirm Payment',
        onCheckout: () {
          // Handle checkout action here
        },
      ),
    );
  }
}
