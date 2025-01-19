import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';

class LogoutButton extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        try {
          await _auth.signOut();
          // Navigate to login screen or show a message
          Get.offAllNamed(AppRoutes.loginScreen);

          // Check if context is still valid (mounted)
          if (!context.mounted) return; // Early return if widget is disposed

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Successfully logged out")),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Logout failed: $e')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppStyles.ticketBottomColor, // Customize button color
        foregroundColor: Colors.white, // Text color
      ),
      child: Text("Logout"),
    );
  }
}
