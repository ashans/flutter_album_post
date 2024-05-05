import 'package:flutter/material.dart';
import 'package:sample_application/domain/models/user_dto.dart';

abstract class AuthService with ChangeNotifier {
  Future<void> authenticate(String username, String password);
  User? get currentUser;
}