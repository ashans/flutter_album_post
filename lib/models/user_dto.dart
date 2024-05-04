
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String username;
  final String name;
  final String email;

  User({required this.id, required this.username, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static List<User> userListFromJson(List<dynamic> json) {
    return json.map((json) => User.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
