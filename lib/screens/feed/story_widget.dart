import 'package:flutter/material.dart';

class User {
  final String name;
  final String imageUrl;

  User({required this.name, required this.imageUrl});
}

class StoryView extends StatelessWidget {
  final List<User> users; // List of users
  final VoidCallback onAddStory; // Callback for adding a new story

  const StoryView({
    super.key,
    required this.users,
    required this.onAddStory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // User's own story with an "Add" icon
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: onAddStory, // Call the callback when tapped
              child: Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.blue, // Background color for the add icon
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Icon(
                      Icons.add, // Add icon
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 65,
                    child: Text(
                      "Add Story",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Other users' stories
          ...users.map((user) {
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(user.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 65,
                    child: Text(
                      user.name, // Display the user's name
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}