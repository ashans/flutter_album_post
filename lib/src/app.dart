import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/src/domain/services/auth_service.dart';
import 'package:sample_application/src/screens/data_view.dart';
import 'package:sample_application/src/screens/login.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    Widget page = const LoginPage();
    if (authService.currentUser != null) {
      page = const DataView();
    }

    return MaterialApp(
      home: page,
    );
  }
}