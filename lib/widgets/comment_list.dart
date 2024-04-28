import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/models/comment_dto.dart';
import 'package:sample_application/providers/resource_provider.dart';

class CommentList extends StatefulWidget {
  final int postId;
  const CommentList({super.key, required this.postId});

  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {
  var comments = <Comment>[];

  void fetchComments(BuildContext context) async {
    final resourceProvider = context.read<ResourceProvider>();
    final fethed = await resourceProvider.getComments(widget.postId);
    setState(() {
      comments = fethed;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchComments(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final item = comments[index];
        return ListTile(
          leading: const Icon(Icons.image),
          title: Text(item.name),
          subtitle: Text(item.body),
          onTap: () {
            
          },
        );
      },
    );
  }
}
