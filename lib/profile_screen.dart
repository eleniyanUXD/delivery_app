import 'package:delivery_app/widgets/edit_profile_info_card.dart';
import 'package:delivery_app/widgets/general_settings_card.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.fromLTRB(16, 12, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EditProfileInfoCard(
                name: 'Abdulrauf Fuad',
                number: '08054551951',
                email: 'Hassanfuad05@gmail.com',
                imagePath: 'assets/images/avatar.png',
                onTap: () {},
              ),

              const SizedBox(height: 20),

              // General settings
              Text(
                'General',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 12),

              GeneralSettingsCard(
                title: 'Notification',
                leftIconPath: 'assets/icons/notification_icon.svg',
                onTap: () {},
              ),

              const SizedBox(height: 16),

              GeneralSettingsCard(
                title: 'Delivery Address',
                leftIconPath: 'assets/icons/location_icon.svg',
                onTap: () {},
              ),

              const SizedBox(height: 16),

              GeneralSettingsCard(
                title: 'Account Settings',
                leftIconPath: 'assets/icons/settings_icon.svg',
                onTap: () {},
              ),

              const SizedBox(height: 16),

              GeneralSettingsCard(
                title: 'Order History',
                leftIconPath: 'assets/icons/order_history_icon.svg',
                onTap: () {},
              ),

              const SizedBox(height: 16),

              GeneralSettingsCard(
                title: 'Support and Help',
                leftIconPath: 'assets/icons/support_icon.svg',
                onTap: () {},
              ),

              const SizedBox(height: 16),

              GeneralSettingsCard(
                title: 'Log Out',
                leftIconPath: 'assets/icons/log_out.svg',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
