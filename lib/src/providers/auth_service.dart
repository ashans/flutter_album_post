import 'package:sample_application/src/domain/models/user_dto.dart';
import 'package:sample_application/src/domain/services/auth_service.dart';
import 'package:sample_application/src/providers/resource_provider.dart';
import 'package:sample_application/src/providers/storage_provider.dart';

class AuthServiceImpl extends AuthService {
  final StorageProvider storage;
  final ResourceProvider resources;

  AuthServiceImpl(this.storage, this.resources);

  @override
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

  @override
  User? get currentUser => storage.currentUser; 
}
