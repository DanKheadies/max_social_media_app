import 'package:flutter/material.dart';

import 'package:max_social_media_app/models/models.dart';
import 'package:max_social_media_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Post> posts = Post.posts;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.black,
      bottomNavigationBar: const CustomBottomBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: posts.map((post) {
            return CustomVideoPlayer(
              post: post,
            );
          }).toList(),
        ),
      ),
    );
  }
}
