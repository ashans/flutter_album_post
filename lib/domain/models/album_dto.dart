import 'package:json_annotation/json_annotation.dart';

part 'album_dto.g.dart';

@JsonSerializable()
class Album {
  final int id;
  final String title;

  Album(this.id, this.title);

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  static List<Album> albumListFromJson(List<dynamic> json) {
    return json.map((json) => Album.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
