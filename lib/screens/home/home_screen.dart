import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/utils/hotel_list.dart';
import 'package:flutter_application_1/base/utils/top_tab_list.dart';
import 'package:flutter_application_1/base/widgets/clickable_tab_bar.dart';
import 'package:flutter_application_1/screens/events/events_screen.dart';
import 'package:flutter_application_1/screens/flight/flight_screen.dart';
import 'package:flutter_application_1/screens/food/food_screen.dart';
import 'package:flutter_application_1/screens/home/all_hotels.dart';
import 'package:flutter_application_1/screens/home/widgets/TravelCard.dart';
import 'package:flutter_application_1/screens/home/widgets/hotel.dart';
import 'package:flutter_application_1/screens/home/widgets/top_navbar.dart';
import 'package:flutter_application_1/screens/hotel/hotel_search.dart';
import 'package:flutter_application_1/screens/search/search.dart';
import 'package:get/get.dart';

import '../../base/res/styles/app_styles.dart';
import '../../base/utils/app_routes.dart';
import '../../base/utils/values/top_tab_list.dart';
import '../../base/utils/values/travel_package_list.dart';
import '../../base/widgets/app_section_heading.dart';
import '../../controller/auth_controller.dart';
import '../../controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();
  final TextEditingController searchController = TextEditingController();

  int _selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    if (authController.isLoggedIn.value) {
      userController.fetchUserDetails();
    }
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (!userController.isLoading.value &&
        authController.isLoggedIn.value &&
        userController.userData.value == null) {
      userController.fetchUserDetails();
    }

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: Obx(() {
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final userData = userController.userData.value;
        final username = userData?['username'] ?? 'No Username';

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: size.height * 0.068),
            _buildGreetingsSection(username),
            const SizedBox(height: 30),
            _topNavBarSection(context),
            const SizedBox(height: 30),
            _buildTopTabBar(),
            const SizedBox(height: 30),
            _buildNearYouSection(context),
            const SizedBox(height: 10),
            _buildHotelScrollView(context),
          ],
        );
      }),
    );
  }

  // Welcome Section
  Widget _buildGreetingsSection(String username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi $username!", style: AppStyles.headLineStyle2),
            Text("WHERE TO!",
                style: AppStyles.greetingsLabel.copyWith(color: Colors.orange)),
            const SizedBox(height: 5),
          ],
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(image: AssetImage(AppMedia.logo)),
          ),
        ),
      ],
    );
  }

  // Top 4 tab Buttons
  Widget _topNavBarSection(BuildContext context) {
    return TopNavbar(
      tabs: topNavList,
      onTabSelected: (int index) {
        if (index == 0) {
          Get.to(HotelSearch());
        } else if (index == 1) {
          Get.to(FlightScreen());
        } else if (index == 2) {
          Get.to(FoodScreen());
        } else if (index == 3) {
          Get.to(EventsScreen());
        }
      },
    );
  }

  // Vacation Package Tab Bar
  Widget _buildTopTabBar() {
    return SizedBox(
      height: 450,
      child: Column(
        children: [
          ClickableTabBar(
            tabNames: tabNames.map((tab) => tab['type']!).toList(),
            selectedTabIndex: _selectedTabIndex,
            onTabSelected: (index) {
              _onTabSelected(index);
            },
          ),
          Expanded(
            child: TravelCard(
              data: _getTravelCardData(_selectedTabIndex),
            ),
          ),
        ],
      ),
    );
  }

  // Method to get TravelCard data based on selected tab index
  Map<String, dynamic> _getTravelCardData(int index) {
    return travelPackages[index % travelPackages.length];
  }

  Widget _buildNearYouSection(BuildContext context) {
    return AppSectionHeading(
      leftText: "Near You",
      rightText: "See All",
      func: () => Navigator.pushNamed(context, AppRoutes.allHotelScreen),
    );
  }

  Widget _buildHotelScrollView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: hotelList.map((hotelItem) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.hotelDetail,
                arguments: {
                  "id": hotelItem["id"],
                },
              );
            },
            child: HotelCard(hotel: hotelItem),
          );
        }).toList(),
      ),
    );
  }
}
