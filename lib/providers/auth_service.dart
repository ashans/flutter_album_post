import 'package:flutter/material.dart';
import 'package:sample_application/models/user_dto.dart';
import 'package:sample_application/providers/resource_provider.dart';
import 'package:sample_application/providers/storage_provider.dart';

class AuthService extends ChangeNotifier {
  final StorageProvider storage;
  final ResourceProvider resources;

  AuthService(this.storage, this.resources);

  Future<void> authenticate(String username, String password) async {
    final users = await resources.getUsers();

    final user = users.firstWhere(
      (element) => element.username.toLowerCase() == username.toLowerCase(),
      orElse: () => throw Exception('Invalid username'),
    );

    if (password != 'pass') {
      throw Exception('Invalid password');
    }
    
    storage.setUser(user);

    notifyListeners();
  }

  User? get currentUser => storage.currentUser; 
}
