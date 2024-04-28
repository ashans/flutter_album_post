import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/providers/user_service.dart';
import 'package:sample_application/providers/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  var err = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(BuildContext context) {
    final authService = context.read<AuthService>();
    final userService = context.read<UserService>();

    var username = _usernameController.text;
    var password = _passwordController.text;

    authService
        .authenticate(username, password)
        .then((authenticated) => userService.setUser(authenticated))
        .onError((_, stackTrace) {
      setState(() {
        err = 'Invalid credentials';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => login(context),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            Text(err, style: const TextStyle(color: Colors.red),)
          ],
        ),
      ),
    );
  }
}
