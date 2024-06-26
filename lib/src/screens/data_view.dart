import 'package:flutter/material.dart';
import 'package:sample_application/src/config/app_config.dart';
import 'package:sample_application/src/screens/profile_view.dart';
import 'package:sample_application/src/widgets/album_list.dart';
import 'package:sample_application/src/widgets/post_list.dart';
import 'package:sample_application/src/widgets/theme_button.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
        title: Text(AppConfig.contentText),
        actions: const [
          ThemeButton()
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          AlbumList(),
          PostList(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.music_note), text: 'Albums'),
            Tab(icon: Icon(Icons.image), text: 'Posts'),
            Tab(icon: Icon(Icons.person), text: 'Profile'),
          ],
        ),
    );
  }
}