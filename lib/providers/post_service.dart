import 'package:sample_application/domain/models/post_dto.dart';
import 'package:sample_application/domain/services/auth_service.dart';
import 'package:sample_application/domain/services/posts_service.dart';
import 'package:sample_application/providers/resource_provider.dart';
import 'package:sample_application/providers/storage_provider.dart';

class PostServiceImpl extends PostService {
  final StorageProvider storage;
  final ResourceProvider resources;
  final AuthService authService;

  PostServiceImpl(this.storage, this.resources, this.authService);

  @override
  void reloadPosts([bool notify = true]) {
    final currentUser = authService.currentUser!;
    final posts = resources.getPosts(currentUser.id);

    storage.setPosts(posts);

    if (notify) {
      notifyListeners();
    }
  }

  @override
  Future<List<Post>> get posts {
    final posts = storage.posts;
    if (posts == null) {
      reloadPosts(false);
    }

    return storage.posts!;
  }
}
