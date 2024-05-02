import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/models/album_dto.dart';
import 'package:sample_application/providers/resource_provider.dart';

class AlbumList extends StatelessWidget {
  AlbumList({super.key});

  Future<List<Album>>? _albums;

  @override
  Widget build(BuildContext context) {
    _albums ??= context.read<ResourceProvider>().getAlbums();

    return FutureBuilder<List<Album>>(
        future: _albums,
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
          return ListView.builder(
            itemCount: albums.length,
            itemBuilder: (context, index) {
              final item = albums[index];
              return ListTile(
                  leading: const Icon(Icons.music_note_outlined),
                  title: Text(item.title));
            },
          );
        });
  }
}
