import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/controller/user_controller.dart';
import 'package:flutter_application_1/screens/feed/data/user_story_list.dart';
import 'package:flutter_application_1/screens/feed/post_view_card.dart';
import 'package:flutter_application_1/screens/feed/widgets/story_widget.dart';
import 'package:flutter_application_1/screens/profile/widget/three_tab_bar.dart';
import 'package:get/get.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

// Controllers for authentication and user data
final AuthController authController = Get.find<AuthController>();
final UserController userController = Get.find<UserController>();
final TextEditingController searchController = TextEditingController();

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch user details if the user is logged in
    if (authController.isLoggedIn.value) {
      userController.fetchUserDetails();
    }
  }

  int selectedTabIndex = 0; // Default to Blog tab

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            SizedBox(height: size.height * 0.068),
            //   Top Feed Nav

            _buildFeedNav(context),

            const SizedBox(height: 20),

            // Horizontal User Story List

            _buildUserName(username),

            const SizedBox(height: 20),

            // Horizontal User Story List
            StoryView(
              users: users,
              onAddStory: () {
                // Handle the action for adding a new story
                print("Add story tapped!");
              },
            ),

            const SizedBox(height: 20),

            // Write Post bar

            _buildWritePost(context),

            const SizedBox(height: 20),
            // Write Post bar

            ThreeTabBar(
              leftTab: "For You",
              middleTab: "Explore",
              rightTab: "Following",
              selectedTabIndex: selectedTabIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedTabIndex = index; // Update the selected index
                });
              },
            ),

            const SizedBox(height: 20),
            // Write Post bar

            _buildPostCard(context),
          ],
        );
      }),
    );
  }
}

// Feed navbar Section

Widget _buildFeedNav(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Feeds",
        style: AppStyles.greetingsLabel,
      ),
// Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       "Hellow Yibo!",
      //       style: TextStyle(
      //         color: Colors.black,
      //         fontSize: 24,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 4,
      //     ),
      //     Text(
      //       "What's you thinking ?",
      //       style: TextStyle(
      //         color: Colors.redAccent,
      //         fontSize: 16,
      //       ),
      //     )
      //   ],
      // )
      Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.search_rounded, color: Colors.white),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            child: Icon(Icons.notification_important, color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

// User name Section

Widget _buildUserName(String username) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Hello $username !",
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        "What's you thinking ?",
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 16,
        ),
      )
    ],
  );
}
// Write post section

Widget _buildWritePost(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/id/237/200/300"),
              fit: BoxFit.cover),
        ),
      ),
      SizedBox(
        width: 20,
      ),
      Expanded(
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Share anything you want.",
                      style: AppStyles.greyHeadlineLabel.copyWith(
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

// Post Card Widget
Widget _buildPostCard(BuildContext context) {
  return PostViewCard();
}
