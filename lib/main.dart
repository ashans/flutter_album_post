import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/domain/services/album_service.dart';
import 'package:sample_application/domain/services/auth_service.dart';
import 'package:sample_application/domain/services/posts_service.dart';
import 'package:sample_application/providers/album_service.dart';
import 'package:sample_application/providers/auth_service.dart';
import 'package:sample_application/providers/post_service.dart';
import 'package:sample_application/providers/resource_provider.dart';
import 'package:sample_application/providers/storage_provider.dart';
import 'package:sample_application/screens/data_view.dart';
import 'package:sample_application/screens/login.dart';

void main() {
  final storageProvider = Provider(create: (_) => StorageProvider());
  final resourceProvider =
      Provider<ResourceProvider>(create: (_) => ResourceProvider());
  final authService = ChangeNotifierProvider<AuthService>(
    create: (context) => AuthServiceImpl(
      Provider.of<StorageProvider>(context, listen: false),
      Provider.of<ResourceProvider>(context, listen: false),
    ),
  );
  final albumService = ChangeNotifierProvider<AlbumService>(
    create: (context) => AlbumServiceImpl(
      Provider.of<StorageProvider>(context, listen: false),
      Provider.of<ResourceProvider>(context, listen: false),
      Provider.of<AuthService>(context, listen: false),
    ),
  );
  final postService = ChangeNotifierProvider<PostService>(
    create: (context) => PostServiceImpl(
      Provider.of<StorageProvider>(context, listen: false),
      Provider.of<ResourceProvider>(context, listen: false),
      Provider.of<AuthService>(context, listen: false),
    ),
  );

  runApp(MultiProvider(
    providers: [
      storageProvider,
      resourceProvider,
      authService,
      albumService,
      postService,
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
