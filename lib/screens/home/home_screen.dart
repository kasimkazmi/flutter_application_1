import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/utils/hotel_list.dart';
import 'package:flutter_application_1/base/utils/top_tab_list.dart';
import 'package:flutter_application_1/base/widgets/clickable_tab_bar.dart';
import 'package:flutter_application_1/screens/features/events/events_screen.dart';
import 'package:flutter_application_1/screens/features/flight/flight_screen.dart';
import 'package:flutter_application_1/screens/features/food/food_screen.dart';
import 'package:flutter_application_1/screens/features/hotel/hotel_search.dart';
import 'package:flutter_application_1/screens/home/widgets/TravelCard.dart';
import 'package:flutter_application_1/screens/home/widgets/hotel.dart';
import 'package:flutter_application_1/screens/home/widgets/resort_card.dart';
import 'package:flutter_application_1/screens/home/widgets/top_navbar.dart';
import 'package:get/get.dart';

import '../../base/res/styles/app_styles.dart';
import '../../base/utils/app_routes.dart';
import '../../base/utils/resort_list.dart';
import '../../base/utils/values/top_tab_list.dart';
import '../../base/utils/travel_package_list.dart';
import '../../base/widgets/app_section_heading.dart';
import '../../controller/auth_controller.dart';
import '../../controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controllers for authentication and user data
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();
  final TextEditingController searchController = TextEditingController();

  // Selected destination for the vacation package tab bar
  String _selectedTabDestination = 'Default'; // Default value

  @override
  void initState() {
    super.initState();
    // Fetch user details if the user is logged in
    if (authController.isLoggedIn.value) {
      userController.fetchUserDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Fetch user details if not already fetched
    if (!userController.isLoading.value &&
        authController.isLoggedIn.value &&
        userController.userData.value == null) {
      userController.fetchUserDetails();
    }

    // Main scaffold of the HomeScreen
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: Obx(() {
        // Show loading indicator while fetching user details
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Retrieve user data and display username
        final userData = userController.userData.value;
        final username = userData?['username'] ?? 'Guest';

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            // Greetings section
            SizedBox(height: size.height * 0.068),
            _buildGreetingsSection(username),
            const SizedBox(height: 30),

            // Top navigation bar (Hotel, Flight, Food, Events)
            _topNavBarSection(context),
            const SizedBox(height: 30),

            // Vacation package tab bar
            _buildTopTabBar(),
            const SizedBox(height: 20),

            // "Near You" section header
            _buildNearYouSection(context),
            const SizedBox(height: 10),
            _buildHotelScrollView(context),
            // "Top Picks" section header
            _buildPopularSection(context),
            const SizedBox(height: 10),
          ],
        );
      }),
    );
  }

  // Greetings Section
  Widget _buildGreetingsSection(String username) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Display username and welcome message
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi $username!", style: AppStyles.headLineStyle2),
            Text(
              "WHERE TO!",
              style: AppStyles.greetingsLabel.copyWith(color: Colors.orange),
            ),
          ],
        ),
        // App logo
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

  // Top Navigation Bar
  Widget _topNavBarSection(BuildContext context) {
    return TopNavbar(
      tabs: topNavList,
      // Navigate to respective screens when a tab is selected
      onTabSelected: (int index) {
        if (index == 0) {
          Get.to(() => HotelSearch());
        } else if (index == 1) {
          Get.to(() => FlightScreen());
        } else if (index == 2) {
          Get.to(() => FoodScreen());
        } else if (index == 3) {
          Get.to(() => EventsScreen());
        }
      },
    );
  }

  // Vacation Package Tab Bar
  Widget _buildTopTabBar() {
    return SizedBox(
      height: 450, // Fixed height for the tab bar and its content
      child: Column(
        spacing: 10,
        children: [
          // ClickableTabBar for selecting vacation types
          ClickableTabBar(
            tabNames: tabNames.map((tab) => tab['type'] ?? 'Default').toList(),
            selectedTabDestination: _selectedTabDestination,
            onTabSelected: (destination) {
              setState(() {
                _selectedTabDestination =
                    destination; // Update the selected destination
                // Load data based on the selected destination
                print("Selected destination: $destination");
                // Here you can load the data for the selected destination
              });
            },
          ),
          // Display TravelCard based on the selected tab
          Expanded(
            child: TravelCardList(
              data: _getTravelCardData(_selectedTabDestination),
            ),
          ),
        ],
      ),
    );
  }

  // Get data for TravelCard based on selected destination
  Map<String, dynamic> _getTravelCardData(String destination) {
    // Find the travel package that matches the selected destination
    final package = travelPackages.firstWhere(
      (pkg) => pkg['destinationType'] == destination,
      orElse: () =>
          {"type": "No data available"}, // Fallback in case of no match
    );
    return package;
  }

  // "Near You" Section Header
  Widget _buildNearYouSection(BuildContext context) {
    return AppSectionHeading(
      leftText: "Near You",
      rightText: "See All",
      func: () => Navigator.pushNamed(context, AppRoutes.allHotelScreen),
    );
  }

  // "Top Picks" Section Header
  Widget _buildPopularSection(BuildContext context) {
    return AppSectionHeading(
      leftText: "Top Picks",
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

  // Horizontal Scroll View of Hotels
  Widget _buildHotelScrolslView(BuildContext context) {
    return SizedBox(
      height: 400, // Fixed height for the scrollable hotel list
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: resorts.map((item) {
            return GestureDetector(
              // Navigate to hotel details screen on tap
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.hotelDetail,
                  arguments: {
                    "id": item["id"],
                  },
                );
              },
              // Render individual ResortCard
              child: SizedBox(
                width: 250, // Fixed width for each card
                child: ResortCard(data: item),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
