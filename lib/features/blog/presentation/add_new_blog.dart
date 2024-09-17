import 'package:flutter/material.dart';

class AddNewBlogScreen extends StatefulWidget {
  static const String routeName = '/add-new-blog';
  const AddNewBlogScreen({super.key});

  @override
  State<AddNewBlogScreen> createState() => _AddNewBlogScreenState();
}

class _AddNewBlogScreenState extends State<AddNewBlogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Blog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            onPressed: () {
              // Save the blog
            },
          )
        ],
      ),
      body: const Center(
        child: Text('Add New Blog'),
      ),
    );
  }
}