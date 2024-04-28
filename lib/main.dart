import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/providers/auth_service.dart';
import 'package:sample_application/providers/resource_provider.dart';
import 'package:sample_application/providers/user_service.dart';
import 'package:sample_application/screens/data_view.dart';
import 'package:sample_application/screens/login.dart';

void main() {
  final authServiceProvider =
      Provider<AuthService>(create: (ref) => AuthService());
  final userServiceProvider =
      ChangeNotifierProvider(create: (context) => UserService());
  final resourceProvider =
      Provider<ResourceProvider>(create: (_) => ResourceProvider());
  runApp(MultiProvider(
    providers: [authServiceProvider, userServiceProvider, resourceProvider],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserService>(context);
    Widget page = const LoginPage();
    if (userProvider.currentUser != null) {
      page = const DataView();
    }

    return MaterialApp(
      home: page,
    );
  }
}
