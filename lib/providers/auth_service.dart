import 'package:sample_application/models/user_dto.dart';

class AuthService {
  Future<User> authenticate(String username, String password) async {
    if (username != 'user' || password != 'pass') {
      throw Exception('Invalid credentials');
    }
    return User(id: username, username: username, name: 'Name of $username');
  }
}
