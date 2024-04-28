import 'package:flutter/material.dart';
import 'package:sample_application/widgets/album_list.dart';
import 'package:sample_application/widgets/post_list.dart';

class DataView extends StatefulWidget {
  const DataView({super.key});

  @override
  State<DataView> createState() => _DataViewState();
}

class _DataViewState extends State<DataView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content'),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AlbumList(),
          PostList(),
        ],
      ),
      bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.music_note), text: 'Albums'),
            Tab(icon: Icon(Icons.image), text: 'Posts'),
          ],
        ),
    );
  }
}