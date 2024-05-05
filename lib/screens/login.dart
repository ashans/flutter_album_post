import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/domain/services/auth_service.dart';
import 'package:sample_application/providers/auth_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController(text: 'bret');
  final _passwordController = TextEditingController(text: 'pass');

  var err = '';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(BuildContext context) {
    final authService = context.read<AuthService>();

    var username = _usernameController.text;
    var password = _passwordController.text;

    authService
        .authenticate(username, password)
        .onError((e, stackTrace) {
      setState(() {
        err = e.toString();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Select a user from\n'),
                  TextSpan(
                      text: 'https://jsonplaceholder.typicode.com/users',
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => launchUrlString(
                            'https://jsonplaceholder.typicode.com/users'))
                ],
                style: const TextStyle(color: Colors.grey),
              ),
            ),
            const Text('Password - pass',
                style: TextStyle(color: Colors.grey)),
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
            if (err != "")
              Text(
                err,
                style: const TextStyle(color: Colors.red),
              )
          ],
        ),
      ),
    );
  }
}
