import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/models/post_dto.dart';
import 'package:sample_application/providers/post_service.dart';
import 'package:sample_application/screens/comment_view.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    final postService = context.watch<PostService>();
    final posts = postService.posts;

    return FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('Error loading posts',
                    style: TextStyle(color: Colors.red)));
          }
          final posts = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async => postService.reloadPosts(),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final item = posts[index];
                return ListTile(
                  leading: const Icon(Icons.image),
                  title: Text(item.title),
                  subtitle: Text(item.body),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommentView(
                                  post: item,
                                )));
                  },
                );
              },
            ),
          );
        });
  }
}
