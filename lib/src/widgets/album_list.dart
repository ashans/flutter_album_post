import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/src/domain/models/album_dto.dart';
import 'package:sample_application/src/domain/services/album_service.dart';

class AlbumList extends StatelessWidget {
  const AlbumList({super.key});

  @override
  Widget build(BuildContext context) {
    final albumService = context.watch<AlbumService>();
    final albums = albumService.albums;

    return FutureBuilder<List<Album>>(
        future: albums,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('Error loading albums',
                    style: TextStyle(color: Colors.red)));
          }
          final albums = snapshot.data!;
          return RefreshIndicator(
            onRefresh: () async => albumService.reloadAlbums(),
            child: ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final item = albums[index];
                return ListTile(
                    leading: const Icon(Icons.music_note_outlined),
                    title: Text(item.title));
              },
            ),
          );
        });
  }
}
