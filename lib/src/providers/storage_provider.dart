import 'package:sample_application/src/domain/models/album_dto.dart';
import 'package:sample_application/src/domain/models/post_dto.dart';
import 'package:sample_application/src/domain/models/user_dto.dart';

class StorageProvider {
  User? _currentUser;
  Future<List<Album>>? _albums;
  Future<List<Post>>? _posts;
  bool _isDarkTheme = false;

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

  set isDarkTheme(isDark) => _isDarkTheme = isDark;
  get isDarkTheme => _isDarkTheme;
}