import 'package:sample_application/src/domain/models/album_dto.dart';
import 'package:http/http.dart' as http;
import 'package:sample_application/src/domain/models/comment_dto.dart';
import 'dart:convert' as convert;

import 'package:sample_application/src/domain/models/post_dto.dart';
import 'package:sample_application/src/domain/models/user_dto.dart';

class ResourceProvider {
  Future<List<Album>> getAlbums(int userId) async {
      final url = Uri.https('jsonplaceholder.typicode.com', 'users/$userId/albums');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResp = convert.jsonDecode(response.body) as List<dynamic>;
        final albums = Album.albumListFromJson(jsonResp);

        return albums;
      } else {
        throw Exception('Error getting albums');
      }
  }

  Future<List<Post>> getPosts(int userId) async {
      final url = Uri.https('jsonplaceholder.typicode.com', 'users/$userId/posts');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResp = convert.jsonDecode(response.body) as List<dynamic>;
        final posts = Post.postListFromJson(jsonResp);

        return posts;
      } else {
        throw Exception('Error getting posts');
      }
  }

  Future<List<Comment>> getComments(int postId) async {
      final url = Uri.https('jsonplaceholder.typicode.com', '/posts/$postId/comments');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResp = convert.jsonDecode(response.body) as List<dynamic>;
        final comments = Comment.commentListFromJson(jsonResp);

        return comments;
      } else {
        throw Exception('Error getting comments');
      }
  }

  Future<List<User>> getUsers() async {
      final url = Uri.https('jsonplaceholder.typicode.com', '/users');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResp = convert.jsonDecode(response.body) as List<dynamic>;
        final users = User.userListFromJson(jsonResp);

        return users;
      } else {
        throw Exception('Error getting comments');
      }
  }
}