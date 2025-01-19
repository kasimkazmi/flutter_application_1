import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/screens/profile/widget/Profile.dart';
import 'package:flutter_application_1/screens/profile/widget/blog_content.dart';
import 'package:flutter_application_1/screens/profile/widget/destinations_content.dart';
import 'package:flutter_application_1/screens/profile/widget/reviews_content.dart';
import 'package:flutter_application_1/screens/profile/widget/three_tab_bar.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({super.key});

  @override
  _ProfileScreen2State createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  int selectedTabIndex = 0; // Default to Blog tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          children: [
            // Profile Section
            ProfileCard(),

            const SizedBox(height: 30),

            // Three Tab Bar Section
            ThreeTabBar(
              leftTab: 'Destinations',
              middleTab: 'Blog',
              rightTab: 'Reviews',
              selectedTabIndex: selectedTabIndex, // Pass the selected index
              onTabSelected: (index) {
                setState(() {
                  selectedTabIndex = index; // Update the selected index
                });
              },
            ),

            const SizedBox(height: 20),

            // Tab Content Section
            Expanded(
              child: selectedTabIndex == 0
                  ? DestinationsContent()
                  : selectedTabIndex == 1
                      ? BlogContent()
                      : ReviewsContent(),
            ),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        color: isSelected ? AppStyles.ticketBottomColor : null,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color:
                isSelected ? Colors.black : Colors.grey.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}
