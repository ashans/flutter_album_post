import 'package:flutter/material.dart';
import 'package:sample_application/models/album_dto.dart';
import 'package:sample_application/models/post_dto.dart';
import 'package:sample_application/providers/auth_service.dart';
import 'package:sample_application/providers/resource_provider.dart';
import 'package:sample_application/providers/storage_provider.dart';

class PostService extends ChangeNotifier {
  final StorageProvider storage;
  final ResourceProvider resources;
  final AuthService authService;

  PostService(this.storage, this.resources, this.authService);

  void reloadPosts([bool notify = true]) {
    final currentUser = authService.currentUser!;
    final posts = resources.getPosts(currentUser.id);

    storage.setPosts(posts);

    if (notify) {
      notifyListeners();
    }
  }

  Future<List<Post>> get posts {
    final posts = storage.posts;
    if (posts == null) {
      reloadPosts(false);
    }

    return storage.posts!;
  }
}
