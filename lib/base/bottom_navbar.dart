import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/search/search_screen.dart';
import 'package:flutter_application_1/screens/ticket/ticket_screen.dart';
import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
//   Dependency Injection
  final BottomNavControler controller = Get.put(BottomNavControler());

  final appScreen = [
    HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: appScreen,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.onItemTapped,
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: const Color(0xFF526400),
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                  label: "Ticket"),
              BottomNavigationBarItem(
                  icon:
                      Icon(FluentSystemIcons.ic_fluent_person_accounts_regular),
                  activeIcon:
                      Icon(FluentSystemIcons.ic_fluent_person_accounts_filled),
                  label: "Profile"),
            ]),
      );
    });
  }
}
