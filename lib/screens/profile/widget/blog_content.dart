import 'package:flutter/cupertino.dart';

import 'blog_post_card.dart';

class BlogContent extends StatelessWidget {
  const BlogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlogPostCard(
          imageUrl: 'assets/beaches.jpg',
          title: 'Top 10 Beaches In Thailand',
          date: '24/08/19',
        ),
        BlogPostCard(
          imageUrl: 'assets/views.jpg',
          title: "Europe's Most Amazing Views",
          date: '17/08/19',
        ),
        BlogPostCard(
          imageUrl: 'assets/tips.jpg',
          title: 'Photography Tips For Travellers',
          date: '10/08/19',
        ),
      ],
    );
  }
}
