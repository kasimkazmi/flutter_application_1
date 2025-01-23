import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';
import 'package:flutter_application_1/screens/feed/story_widget.dart';
import 'package:flutter_application_1/screens/profile/widget/three_tab_bar.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int selectedTabIndex = 0; // Default to Blog tab

  @override
  Widget build(BuildContext context) {
    // Example list of users with their story image URLs
    final List<User> users = [
      User(name: "Alice", imageUrl: "https://picsum.photos/id/237/200/300"),
      User(name: "Bob", imageUrl: "https://picsum.photos/id/238/200/300"),
      User(name: "Charlie", imageUrl: "https://picsum.photos/id/239/200/300"),
      User(name: "David", imageUrl: "https://picsum.photos/id/240/200/300"),
      User(name: "Eve", imageUrl: "https://picsum.photos/id/241/200/300"),
    ];
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                          child:
                              Icon(Icons.search_rounded, color: Colors.white),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[800],
                          child: Icon(Icons.notification_important,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hellow Yibo!",
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
                ),
                SizedBox(
                  height: 25,
                ),

                //
                // Horizontal User Story List

                StoryView(
                  users: users,
                  onAddStory: () {
                    // Handle the action for adding a new story
                    print("Add story tapped!");
                  },
                ),

                // Post add section

                //
                Row(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://picsum.photos/id/237/200/300"),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
                ),
                SizedBox(height: 20),
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

                SizedBox(
                  height: 20,
                ),

                const SizedBox(height: 20),
                // Post Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.grey[800],
                                child: Icon(Icons.person, color: Colors.white),
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Mark Kyle",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "24 days ago",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.more_horiz, color: Colors.white70),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "I miss my parents too much. I haven't talked to them in 2 years.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [Colors.orange, Colors.pink],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.favorite, color: Colors.red),
                              SizedBox(width: 8),
                              Text("10", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.comment, color: Colors.white70),
                              SizedBox(width: 8),
                              Text("12 Comments",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
