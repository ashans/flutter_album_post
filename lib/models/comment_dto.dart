import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class Comment {
  final int id;
  final String name;
  final String body;

  Comment(this.id, this.name, this.body);

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

  static List<Comment> commentListFromJson(List<dynamic> json) {
    return json.map((json) => Comment.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}