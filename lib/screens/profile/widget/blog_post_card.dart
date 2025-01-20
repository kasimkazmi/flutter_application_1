import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/utils/app_routes.dart';

class BlogPostCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final int id; // Add an ID field to pass to the details screen

  const BlogPostCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.id, // Include the ID in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the blog details screen and pass the ID
        Navigator.pushNamed(
          context,
          AppRoutes.blogDetails, // Replace with your actual route name
          arguments: {
            'id': id, // Pass the blog post ID
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                width: 100,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
