import 'package:sample_application/src/domain/models/album_dto.dart';
import 'package:sample_application/src/domain/services/album_service.dart';
import 'package:sample_application/src/domain/services/auth_service.dart';
import 'package:sample_application/src/providers/resource_provider.dart';
import 'package:sample_application/src/providers/storage_provider.dart';

class AlbumServiceImpl extends AlbumService {
  final StorageProvider storage;
  final ResourceProvider resources;
  final AuthService authService;

  AlbumServiceImpl(this.storage, this.resources, this.authService);

  @override
  void reloadAlbums([bool notify = true]) {
    final currentUser = authService.currentUser!;
    final albums = resources.getAlbums(currentUser.id);

    storage.setAlbums(albums);

    if (notify) {
      notifyListeners();
    }
  }

  @override
  Future<List<Album>> get albums {
    final albums = storage.albums;
    if (albums == null) {
      reloadAlbums(false);
    }

    return storage.albums!;
  }
}
