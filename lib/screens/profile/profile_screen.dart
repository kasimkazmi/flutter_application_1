import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/base/widgets/text_column_layout.dart';
import 'package:flutter_application_1/base/widgets/text_style_forth.dart';
import 'package:get/get.dart';

import '../../base/utils/app_routes.dart';
import '../../base/widgets/logout_button.dart';
import '../../controller/auth_controller.dart';
import '../../controller/user_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Accessing the AuthController and UserController
  final AuthController authController = Get.find<AuthController>();
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    // Trigger user details fetching when screen loads and user is logged in
    if (!userController.isLoading.value && authController.isLoggedIn.value) {
      userController.fetchUserDetails();
    }

// If user data is fetched successfully, proceed with building UI
    final userData = userController.userData.value!;
    final username = userData['username'] ?? 'No Username';
    final email = userData['email'] ?? 'No Email';

    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          children: [
            const Padding(padding: EdgeInsets.only(top: 40)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Avatar
                Container(
                  width: 86,
                  height: 86,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage(AppMedia.logo))),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username, // Display email
                      style: AppStyles.headLineStyle2,
                    ),
                    Text(
                      email, // Display email
                      style: AppStyles.greetingsLabel.copyWith(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      decoration: BoxDecoration(
                          color: AppStyles.profileLocationBG,
                          borderRadius: BorderRadius.circular(100)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppStyles.profileStatusTextColor,
                            ),
                            child: const Icon(
                              FluentSystemIcons.ic_fluent_shield_filled,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Premium Status",
                            style: TextStyle(
                                color: AppStyles.profileStatusTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),

                InkWell(
                  onTap: () {
                    // Navigate to the Edit screen using GetX
                    Navigator.pushNamed(context, AppRoutes.editScreen);
                  },
                  child: Text(
                    "Edit",
                    style: AppStyles.greetingsLabel
                        .copyWith(color: AppStyles.primaryColor),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.grey.shade300,
            ),

            /*Reward Card view*/
            Stack(
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppStyles.primaryColor,
                      borderRadius: BorderRadius.circular(18)),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: AppStyles.ticketBGColor,
                        child: const Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                          size: 27,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextStyleForth(
                            text: "You've got new award",
                            isColor: null,
                          ),
                          Text(
                            "You have 96 flights in a year",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.45)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: -40,
                    right: -45,
                    child: Container(
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(width: 18, color: Color(0xFF264CD2))),
                    ))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Accumulate Miles",
              style: AppStyles.headLineStyle2,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppStyles.bgColor,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "154545",
                    style: TextStyle(fontSize: 45, color: AppStyles.textColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  // Miles Data Table
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Miles accrued",
                        style: AppStyles.greyHeadlineLabel,
                      ),
                      Text(
                        "16th July",
                        style: AppStyles.greyHeadlineLabel,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextColumnLayout(
                          isColor: true,
                          topText: "23 042",
                          bottomText: "Miles",
                          crossAxisAlignment: CrossAxisAlignment.start),
                      TextColumnLayout(
                          isColor: true,
                          topText: "Airline CO",
                          bottomText: "Received from",
                          crossAxisAlignment: CrossAxisAlignment.end),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextColumnLayout(
                          isColor: true,
                          topText: "23 ",
                          bottomText: "Miles",
                          crossAxisAlignment: CrossAxisAlignment.start),
                      TextColumnLayout(
                          isColor: true,
                          topText: "Airline CO",
                          bottomText: "Received from",
                          crossAxisAlignment: CrossAxisAlignment.end),
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextColumnLayout(
                          isColor: true,
                          topText: "23 042",
                          bottomText: "Miles",
                          crossAxisAlignment: CrossAxisAlignment.start),
                      TextColumnLayout(
                          isColor: true,
                          topText: "Airline CO",
                          bottomText: "Received from",
                          crossAxisAlignment: CrossAxisAlignment.end),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  InkWell(
                    onTap: () {},
                    child: Text(
                      "How to get more details",
                      style: AppStyles.textStyle.copyWith(
                          color: AppStyles.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Logout Button
                  LogoutButton()
                ],
              ),
            )
            //   Divider
          ],
        ));
  }
}
