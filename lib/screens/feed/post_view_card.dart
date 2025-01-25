import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this package for date formatting

import '../../base/widgets/network_image_handler.dart';

class Post {
  final String username;
  final DateTime timeAgo;
  final String content;
  final int likes;
  final int comments;
  final String imageUrl;
  final String profileImageUrl;

  Post({
    required this.imageUrl,
    required this.username,
    required this.timeAgo,
    required this.content,
    required this.likes,
    required this.comments,
    required this.profileImageUrl,
  });
}

class PostViewCard extends StatelessWidget {
  final Post post;
  const PostViewCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    // Format the DateTime to a readable String
    String formattedTimeAgo = DateFormat('hh:mm a').format(post.timeAgo);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
      margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
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
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: NetworkImage(post.profileImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.username,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        formattedTimeAgo,
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
          Text(
            post.content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          NetworkImageWithErrorHandler(
            imageUrl: post.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  SizedBox(width: 8),
                  Text("${post.likes}",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.comment, color: Colors.white70),
                  SizedBox(width: 8),
                  Text("${post.comments}",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
