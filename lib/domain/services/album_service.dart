import 'package:flutter/material.dart';
import 'package:sample_application/domain/models/album_dto.dart';

abstract class AlbumService with ChangeNotifier {
  void reloadAlbums([bool notify = true]);
  Future<List<Album>> get albums;
}