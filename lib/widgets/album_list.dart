import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_application/models/album_dto.dart';
import 'package:sample_application/providers/resource_provider.dart';

class AlbumList extends StatefulWidget {
  const AlbumList({super.key});

  @override
  State<AlbumList> createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  var albums = <Album>[];

  void fetchAlbums(BuildContext context) async {
    final resourceProvider = context.read<ResourceProvider>();
    final fethed = await resourceProvider.getAlbums();
    setState(() {
      albums = fethed;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAlbums(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final item = albums[index];
        return ListTile(
            leading: const Icon(Icons.music_note_outlined), title: Text(item.title));
      },
    );
  }
}
