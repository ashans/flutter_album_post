import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class Post {
  final int id;
  final String title;
  final String body;

  Post(this.id, this.title, this.body);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  static List<Post> postListFromJson(List<dynamic> json) {
    return json.map((json) => Post.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => _$PostToJson(this);
}