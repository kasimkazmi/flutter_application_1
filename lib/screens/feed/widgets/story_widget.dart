import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class User {
  final String name;
  final String imageUrl;
  bool isActive;
  bool isViewed;

  User({
    this.isActive = false,
    this.isViewed = false,
    required this.name,
    required this.imageUrl,
  });
}

class StoryView extends StatefulWidget {
  final List<User> users; // List of users
  final VoidCallback onAddStory; // Callback for adding a new story

  const StoryView({
    super.key,
    required this.users,
    required this.onAddStory,
  });

  @override
  _StoryViewState createState() => _StoryViewState();
}

class _StoryViewState extends State<StoryView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.users.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            // User's own story with an "Add" icon
            return Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: GestureDetector(
                onTap: widget.onAddStory, // Call the callback when tapped
                child: Column(
                  children: [
                    // Own story container with profile image and blur effect
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: NetworkImage(widget.users[0].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Icon(
                          Icons.add, // Add icon
                          color: Colors.white,
                          size: 30,
                        ),
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
            );
          } else {
            // Other users' stories
            final user = widget.users[index - 1];
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (!user.isViewed) {
                    user.isViewed = true;
                    user.isActive = false;
                    widget.users.removeAt(index - 1);
                    widget.users.add(user);
                  }
                });
                showDialog(
                  context: context,
                  builder: (context) => StoryPreviewModal(user: user),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  children: [
                    Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: user.isActive && !user.isViewed
                            ? LinearGradient(
                                colors: [Colors.blue, Colors.purple],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                            : null,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.29),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: user.isActive && !user.isViewed
                                ? Border.all(color: AppStyles.bgColor, width: 4)
                                : null,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(user.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
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
              ),
            );
          }
        },
      ),
    );
  }
}

class StoryPreviewModal extends StatelessWidget {
  final User user;

  const StoryPreviewModal({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Story image preview
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.network(
              user.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          // User info and story details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "October 11, 2020", // Example date
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Close button
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
