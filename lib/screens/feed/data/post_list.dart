import '../post_view_card.dart';

final List<Post> posts = [
  Post(
    username: "Mark Kyle",
    profileImageUrl: "https://picsum.photos/id/237/200/300",
    timeAgo: DateTime.now()
        .subtract(Duration(hours: 1)), // Correctly passing DateTime
    content: "I miss my parents too much. I haven't talked to them in 2 years.",
    likes: 10,
    comments: 12,
    imageUrl: "https://picsum.photos/id/247/200/302",
  ),
  Post(
    username: "Jane Doe",
    profileImageUrl: "https://picsum.photos/id/237/200/300",

    timeAgo: DateTime.now()
        .subtract(Duration(hours: 2)), // Correctly passing DateTime
    content: "Just finished reading a great book!",
    likes: 5,
    comments: 3,
    imageUrl: "https://picsum.photos/id/247/200/300",
  ),
  Post(
    username: "John Smith",
    profileImageUrl: "https://picsum.photos/id/237/200/300",
    timeAgo: DateTime.now()
        .subtract(Duration(hours: 3)), // Correctly passing DateTime
    content: "Excited for the weekend!",
    likes: 8,
    comments: 2,
    imageUrl: "https://picsum.photos/id/247/200/300",
  ),
].map((post) {
  print("Post -> timeAgo: ${post.timeAgo}, Type: ${post.timeAgo.runtimeType}");
  return post;
}).toList();
