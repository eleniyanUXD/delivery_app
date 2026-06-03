import 'package:flutter/material.dart';
import 'dart:async';
import 'widgets/order_step.dart';
import 'widgets/app_button.dart';
import 'home_screen.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  int currentStep = 0;
  int seconds = 0;
  Timer? timer;

  final List<String> steps = [
    "We have confirmed your order: One portion of jollof rice and chicken",
    "Preparing your order",
    "Order has been assigned to a dispatch rider",
    "Dispatch driver is on their way",
    "Dispatch rider is at your location",
  ];

  @override
  void initState() {
    super.initState();
    _startSimulation();
  }

  void _startSimulation() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        seconds++;

        // progress steps smoothly (every 2 seconds)
        currentStep = (seconds ~/ 2).clamp(0, steps.length - 1);

        if (currentStep == steps.length - 1) {
          t.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Order Status',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Progress',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // LIVE STATUS + TIMER (FIX FOR STATIC ISSUE)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  steps[currentStep],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "Elapsed time: ${seconds}s",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                ),
              ],
            ),

            const SizedBox(height: 24),

            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return OrderStep(
                    text: steps[index],
                    isCompleted: index <= currentStep,
                    isLast: index == steps.length - 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AppButton(
            text: 'Order Received',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
