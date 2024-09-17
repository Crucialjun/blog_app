import 'package:blog_app/features/blog/presentation/add_new_blog.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              Navigator.of(context).pushNamed(AddNewBlogScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
