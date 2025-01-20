import 'package:flutter/material.dart';
import 'package:flutter_application_1/base/res/media.dart';
import 'package:flutter_application_1/base/res/styles/app_styles.dart';

import '../../../base/utils/blog_list.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the blog post ID from the arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final int blogId = args['id'];

    // Find the blog post by ID
    final blogPost = blogPostList.firstWhere((post) => post['id'] == blogId);

    return Scaffold(
      appBar: AppBar(
        // title: Text(blogPost['title']),
        backgroundColor: AppStyles.bgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              child: Image.asset(
                blogPost['image'],
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                blogPost['title'],
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Date
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                blogPost['date'],
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                blogPost['description'],
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
