import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

class Story {
  final String title; // Title of the story
  final String imageUrl; // Image URL of the story
  final DateTime timestamp; // When the story was posted

  Story({
    required this.title,
    required this.imageUrl,
    required this.timestamp,
  });
}

class User {
  final String name;
  final String profileImageUrl;
  bool isActive;
  bool isViewed;
  final List<Story> stories; // List of stories for the user

  User({
    this.isActive = false,
    this.isViewed = false,
    required this.name,
    required this.profileImageUrl,
    required this.stories,
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
                          image: NetworkImage(widget.users[0].profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black.withValues(alpha: 0.5),
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
                                  image: NetworkImage(user.profileImageUrl),
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

class StoryPreviewModal extends StatefulWidget {
  final User user;

  const StoryPreviewModal({super.key, required this.user});

  @override
  _StoryPreviewModalState createState() => _StoryPreviewModalState();
}

class _StoryPreviewModalState extends State<StoryPreviewModal> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the height of the screen
    double screenHeight = MediaQuery.of(context).size.height;

    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Scrollable list of story images using PageView
          SizedBox(
            height:
                screenHeight * 0.5, // Set height to 50% of the screen height
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.user.stories.length,
              itemBuilder: (context, index) {
                final story = widget.user.stories[index];
                return SizedBox(
                  width: 400, // Set a fixed width for each story
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(0)),
                        child: Image.network(
                          story.imageUrl,
                          height: screenHeight *
                              0.4, // Set height to 40% of the screen height
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        story.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${story.timestamp}", // Display the timestamp
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            ),
          ),
          // Close button positioned at the top right corner
          Positioned(
            top: 16.0,
            right: 16.0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          // Dot indicator
          Positioned(
            bottom: 16.0, // Position it above the bottom of the image
            left: MediaQuery.of(context).size.width / 2 -
                24, // Center horizontally

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.user.stories.length, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index ? Colors.white : Colors.grey,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
