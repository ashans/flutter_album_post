import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/models/comment_dto.dart';
import 'package:sample_application/providers/resource_provider.dart';

class CommentList extends StatelessWidget {
  final int postId;
  const CommentList({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Comment>>(
        future: context.read<ResourceProvider>().getComments(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('Error loading albums',
                    style: TextStyle(color: Colors.red)));
          }
          final comments = snapshot.data!;
          return ListView.builder(
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final item = comments[index];
              return ListTile(
                leading: const Icon(Icons.image),
                title: Text(item.name),
                subtitle: Text(item.body),
              );
            },
          );
        });
  }
}
