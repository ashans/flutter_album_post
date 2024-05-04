import 'package:flutter/material.dart';
import 'package:sample_application/models/album_dto.dart';
import 'package:sample_application/providers/auth_service.dart';
import 'package:sample_application/providers/resource_provider.dart';
import 'package:sample_application/providers/storage_provider.dart';

class AlbumService extends ChangeNotifier {
  final StorageProvider storage;
  final ResourceProvider resources;
  final AuthService authService;

  AlbumService(this.storage, this.resources, this.authService);

  void reloadAlbums([bool notify = true]) {
    final currentUser = authService.currentUser!;
    final albums = resources.getAlbums(currentUser.id);

    storage.setAlbums(albums);

    if (notify) {
      notifyListeners();
    }
  }

  Future<List<Album>> get albums {
    final albums = storage.albums;
    if (albums == null) {
      reloadAlbums(false);
    }

    return storage.albums!;
  }
}
