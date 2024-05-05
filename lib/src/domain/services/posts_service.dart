import 'package:flutter/material.dart';
import 'package:sample_application/src/domain/models/post_dto.dart';

abstract class PostService with ChangeNotifier {
  void reloadPosts([bool notify = true]);
  Future<List<Post>> get posts;
}