import 'package:flutter/material.dart';
import 'package:sample_application/models/user_dto.dart';

class UserService extends ChangeNotifier {
  User? currentUser;

  void setUser(User user) {
    currentUser = user;
    notifyListeners();
  }
}