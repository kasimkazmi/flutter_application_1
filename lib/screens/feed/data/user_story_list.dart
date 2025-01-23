import '../widgets/story_widget.dart';

final List<User> users = [
  User(
    name: "Alice",
    profileImageUrl: "https://picsum.photos/id/237/200/300",
    isActive: true,
    stories: [
      Story(
        title: "At the Beach",
        imageUrl: "https://picsum.photos/id/238/200/300",
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
      ),
      Story(
        title: "Sunset View",
        imageUrl: "https://picsum.photos/id/239/200/300",
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
      ),
    ],
  ),
  User(
    name: "Bob",
    profileImageUrl: "https://picsum.photos/id/240/200/300",
    stories: [
      Story(
        title: "Delicious Food",
        imageUrl: "https://picsum.photos/id/241/200/300",
        timestamp: DateTime.now().subtract(Duration(hours: 3)),
      ),
    ],
  ),
  User(
    name: "Charlie",
    profileImageUrl: "https://picsum.photos/id/242/200/300",
    isActive: true,
    stories: [
      Story(
        title: "Workout Session",
        imageUrl: "https://picsum.photos/id/243/200/300",
        timestamp: DateTime.now().subtract(Duration(hours: 4)),
      ),
      Story(
        title: "Morning Run",
        imageUrl: "https://picsum.photos/id/244/200/300",
        timestamp: DateTime.now().subtract(Duration(hours: 5)),
      ),
    ],
  ),
  User(
    name: "David",
    profileImageUrl: "https://picsum.photos/id/244/200/300",
    stories: [
      Story(
        title: "Art Exhibition",
        imageUrl: "https://picsum.photos/id/247/200/300",
        timestamp: DateTime.now().subtract(Duration(hours: 6)),
      ),
    ],
  ),
  User(
    name: "Eve",
    profileImageUrl: "https://picsum.photos/id/244/200/300",
    isActive: true,
    stories: [
      Story(
        title: "Art Exhibition",
        imageUrl: "https://picsum.photos/id/247/200/300",
        timestamp: DateTime.now().subtract(Duration(hours: 6)),
      ),
    ],
  ),
];
