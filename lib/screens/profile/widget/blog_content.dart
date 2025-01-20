import 'package:flutter/cupertino.dart';
import '../../../base/utils/blog_list.dart';
import 'blog_post_card.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Assuming blogPostList is defined and imported
    return ListView.builder(
      itemCount: blogPostList.length,
      itemBuilder: (context, index) {
        final post = blogPostList[index];
        return BlogPostCard(
          imageUrl: post["image"], // Use the image from the blog post
          title: post["title"], // Use the title from the blog post
          date: post["date"], // Use the date from the blog post
          id: post["id"], // Pass the ID to the BlogPostCard
        );
      },
    );
  }
}
