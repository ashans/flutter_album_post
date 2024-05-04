import 'package:sample_application/models/album_dto.dart';
import 'package:sample_application/models/post_dto.dart';
import 'package:sample_application/models/user_dto.dart';

class StorageProvider {
  User? _currentUser;
  Future<List<Album>>? _albums;
  Future<List<Post>>? _posts;

  void setUser(User user) {
    _currentUser = user;
  }
  User? get currentUser => _currentUser;

  void setAlbums(Future<List<Album>> albums) {
    _albums = albums;
  }
  Future<List<Album>>? get albums => _albums;

  void setPosts(Future<List<Post>> posts) {
    _posts = posts;
  }
  Future<List<Post>>? get posts => _posts;
}