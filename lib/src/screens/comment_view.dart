import 'package:flutter/material.dart';
import 'package:sample_application/src/domain/models/post_dto.dart';
import 'package:sample_application/src/widgets/comment_list.dart';

class CommentView extends StatelessWidget {
  final Post post;
  const CommentView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final postId = post.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments for ${post.title}'),
      ),
      body: CommentList(
        postId: postId,
      ),
    );
  }
}
