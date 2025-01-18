import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/utils/hotel_list.dart';
import 'package:flutter_application_1/base/utils/ticket_json.dart';
import 'package:flutter_application_1/base/widgets/ticket_view.dart';
import 'package:flutter_application_1/screens/home/widgets/hotel.dart';
import 'package:get/get.dart';

import '../../base/res/styles/app_styles.dart';
import '../../base/utils/app_routes.dart';
import '../../base/widgets/app_section_headingText.dart';
import '../../controller/auth_controller.dart';
import '../../controller/user_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Accessing the AuthController and UserController
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {

    // Trigger user details fetching when screen loads and user is logged in
    if (!userController.isLoading.value && authController.isLoggedIn.value) {
      userController.fetchUserDetails();
    }

    // Show error message if there is any
    if (userController.errorMessage.value != null) {
      return Center(
        child: Text(
          userController.errorMessage.value!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    // If user data is fetched successfully, proceed with building UI
    final userData = userController.userData.value!;
    final username = userData['username'] ?? 'No Username';

    //ListView
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        //Scrollable effect
        body: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Greetings !", style: AppStyles.greetingsLabel),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(username, style: AppStyles.headLineStyle2),
                        ],
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(AppMedia.logo))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFF4F6FD)),
                    child: Row(
                      children: [
                        Icon(FluentSystemIcons.ic_fluent_search_regular,
                            color: Color(0xFFBFC205)),
                        Text("Search "),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  AppSectionHeading(
                      leftText: "Upcoming Meetings",
                      rightText: "View All",
                      func: () =>
                          Navigator.pushNamed(context, AppRoutes.allTickets)),
                  const SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ticketList
                            .map((singleTicket) => GestureDetector(
                                onTap: () {
                                  var index = ticketList.indexOf(singleTicket);
                                  Navigator.pushNamed(
                                      context, AppRoutes.ticketScreen,
                                      arguments: {"index": index});
                                },
                                child: TicketView(
                                  ticket: singleTicket,
                                )))
                            .toList(), // Convert Iterable to List<Widget>
                      )),
                  const SizedBox(height: 40),

                  // View All Button
                  AppSectionHeading(
                      leftText: "Hotels",
                      rightText: "View All",
                      func: () => Navigator.pushNamed(
                          context, AppRoutes.allHotelScreen)),

                  // Hotel Card View
                  const SizedBox(height: 25),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: hotelList
                            .map((hotelItem) => GestureDetector(
                                  onTap: () {
                                    var index = hotelList.indexOf(hotelItem);
                                    print("aosm =====>$index");
                                    Navigator.pushNamed(
                                        context, AppRoutes.hotelDetail,
                                        arguments: {"index": index});
                                  },
                                  child: HotelCard(
                                    hotel: hotelItem,
                                  ),
                                ))
                            .toList(),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
