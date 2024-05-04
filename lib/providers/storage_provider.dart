import 'package:flutter/material.dart';
import 'package:sample_application/models/user_dto.dart';

class StorageProvider {
  User? _currentUser;

  void setUser(User user) {
    _currentUser = user;
  }

  User? get currentUser => _currentUser;
}