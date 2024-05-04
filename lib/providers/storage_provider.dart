import 'package:flutter/material.dart';
import 'package:sample_application/models/album_dto.dart';
import 'package:sample_application/models/user_dto.dart';

class StorageProvider {
  User? _currentUser;
  Future<List<Album>>? _albums;

  void setUser(User user) {
    _currentUser = user;
  }
  User? get currentUser => _currentUser;

  void setAlbums(Future<List<Album>> albums) {
    _albums = albums;
  }
  Future<List<Album>>? get albums => _albums;
}