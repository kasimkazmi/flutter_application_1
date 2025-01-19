import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/utils/hotel_list.dart';
import 'package:flutter_application_1/base/utils/ticket_json.dart';
import 'package:flutter_application_1/base/utils/top_tab_list.dart';
import 'package:flutter_application_1/base/widgets/ticket_view.dart';
import 'package:flutter_application_1/screens/events/events_screen.dart';
import 'package:flutter_application_1/screens/flight/flight_screen.dart';
import 'package:flutter_application_1/screens/food/food_screen.dart';
import 'package:flutter_application_1/screens/home/all_hotels.dart';
import 'package:flutter_application_1/screens/home/widgets/hotel.dart';
import 'package:flutter_application_1/screens/home/widgets/top_navbar.dart';
import 'package:flutter_application_1/screens/hotel/hotel_search.dart';
import 'package:flutter_application_1/screens/search/search.dart';
import 'package:get/get.dart';

import '../../base/res/styles/app_styles.dart';
import '../../base/utils/app_routes.dart';
import '../../base/widgets/app_section_heading.dart';
import '../../controller/auth_controller.dart';
import '../../controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Accessing the AuthController and UserController
  final AuthController authController = Get.find<AuthController>();

  final UserController userController = Get.find<UserController>();

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch user details when the screen loads
    if (authController.isLoggedIn.value) {
      userController.fetchUserDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Only fetch user details once when the app loads or when user logs in
    if (!userController.isLoading.value &&
        authController.isLoggedIn.value &&
        userController.userData.value == null) {
      userController.fetchUserDetails();
    }

    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: Obx(() {
        // Show loading spinner while fetching user data
        if (userController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Safely access user data (use conditional operator to handle null case)
        final userData = userController.userData.value;
        final username =
            userData?['username'] ?? 'No Username'; // Use safe access

        // Build the UI
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(
              height: size.height * 0.068,
            ),

            _buildGreetingsSection(username),
            const SizedBox(height: 25),

            // InputText(
            //     label: "Search",
            //     controller: searchController,
            //     prefixIcon: FluentSystemIcons.ic_fluent_search_regular),

            // _buildSearchBox(),
            _topNavBarSection(context),
            // _buildUpcomingMeetingsSection(context),
            // const SizedBox(height: 20),
            // _buildTicketScrollView(context),
            const SizedBox(height: 40),
            _buildHotelsSection(context),
            const SizedBox(height: 25),
            _buildHotelScrollView(context),
          ],
        );
      }),
    );
  }

  // Extracted methods for different sections to reduce duplication
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

  Widget _buildUpcomingMeetingsSection(BuildContext context) {
    return AppSectionHeading(
      leftText: "Upcoming Meetings",
      rightText: "View All",
      func: () => Navigator.pushNamed(context, AppRoutes.allTickets),
    );
  }

  Widget _buildTicketScrollView(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ticketList.map((singleTicket) {
          return GestureDetector(
            onTap: () {
              var index = ticketList.indexOf(singleTicket);
              Navigator.pushNamed(context, AppRoutes.ticketScreen,
                  arguments: {"index": index});
            },
            child: TicketView(ticket: singleTicket),
          );
        }).toList(),
      ),
    );
  }

  Widget _topNavBarSection(BuildContext context) {
    return TopNavbar(
      tabs: topNavList, // Use the predefined list directly
      onTabSelected: (int index) {
        // Handle tab selection dynamically
        if (index case 0) {
          print('Navigating to Hotels');
          Get.to(HotelSearch());
        } else if (index case 1) {
          print('Navigating to Flights');
          Get.to(FlightScreen());
        } else if (index case 2) {
          print('Navigating to Foods');
          Get.to(FoodScreen());
        } else if (index case 3) {
          print('Navigating to Events');
          Get.to(EventsScreen());
        }
      },
    );
  }

  Widget _buildHotelsSection(BuildContext context) {
    return AppSectionHeading(
      leftText: "Recommendation",
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
              var index = hotelList.indexOf(hotelItem);
              Navigator.pushNamed(context, AppRoutes.hotelDetail,
                  arguments: {"index": index});
            },
            child: HotelCard(hotel: hotelItem),
          );
        }).toList(),
      ),
    );
  }
}
