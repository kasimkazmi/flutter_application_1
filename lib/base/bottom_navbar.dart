import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/screens/feed/feed_screen.dart';
import 'package:flutter_application_1/screens/profile/profile_screen2.dart';
import 'package:flutter_application_1/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';
import '../screens/home/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  // Dependency Injection
  final BottomNavControler controller = Get.put(BottomNavControler());

  final appScreen = [
    HomeScreen(),
    FeedScreen(),
    TicketScreen(),
    ProfileScreen2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: appScreen, // Ensure all screens are properly initialized
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: AppStyles.circleColor, // Set the background color here
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 8,
                offset: Offset(0, -4), // Shadows on the top of the bottom bar
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: const Color(0xFF526400),
            backgroundColor: Colors.transparent, // Set this to transparent
            elevation:
                0, // Remove the default elevation to let custom shadow work
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                      FluentSystemIcons.ic_fluent_broad_activity_feed_regular),
                  activeIcon: Icon(
                      FluentSystemIcons.ic_fluent_broad_activity_feed_filled),
                  label: "Feeds"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                  label: "Bookings"),
              BottomNavigationBarItem(
                  icon:
                      Icon(FluentSystemIcons.ic_fluent_person_accounts_regular),
                  activeIcon:
                      Icon(FluentSystemIcons.ic_fluent_person_accounts_filled),
                  label: "Profile"),
            ],
          ),
        ),
      );
    });
  }
}
