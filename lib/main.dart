import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/src/app.dart';
import 'package:sample_application/src/domain/services/album_service.dart';
import 'package:sample_application/src/domain/services/auth_service.dart';
import 'package:sample_application/src/domain/services/posts_service.dart';
import 'package:sample_application/src/providers/album_service.dart';
import 'package:sample_application/src/providers/auth_service.dart';
import 'package:sample_application/src/providers/post_service.dart';
import 'package:sample_application/src/providers/resource_provider.dart';
import 'package:sample_application/src/providers/storage_provider.dart';

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
    child: const App(),
  ));
}
