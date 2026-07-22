import 'package:delivery_app/widgets/edit_profile_info_card.dart';
import 'package:delivery_app/widgets/general_settings_card.dart';
import 'package:flutter/material.dart';
import 'edit_screen.dart';
import 'package:delivery_app/services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Abdulrauf Fuad';
  String number = '08054551951';
  String email = 'Hassanfuad05@gmail.com';

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
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              EditProfileInfoCard(
                name: name,
                number: number,
                email: email,
                imagePath: 'assets/images/avatar.png',

                onEditNumber: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditFieldScreen(
                        title: "Phone Number",
                        initialValue: number,
                      ),
                    ),
                  );

                  if (result != null) {
                    setState(() => number = result);
                  }
                },

                onEditEmail: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          EditFieldScreen(title: "Email", initialValue: email),
                    ),
                  );

                  if (result != null) {
                    setState(() => email = result);
                  }
                },
              ),

              const SizedBox(height: 20),

              const Text(
                'General Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),

              const SizedBox(height: 20),

              GeneralSettingsCard(
                title: 'Notification',
                leftIconPath: 'assets/icons/notification_icon.svg',
                onTap: () => debugPrint("Notification tapped"),
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
                onTap: () => AuthService.logout(context),
                isDestructive: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
