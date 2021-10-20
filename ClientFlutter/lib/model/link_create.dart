import 'package:json_annotation/json_annotation.dart';

part 'link_create.g.dart';

@JsonSerializable()
class LinkCreate {
  String target;
  int linkType;
  String? password;

  LinkCreate({
    required this.target,
    this.linkType = 0,
    this.password,
  });

  factory LinkCreate.fromJson(Map<String, dynamic> json) => _$LinkCreateFromJson(json);

  Map<String, dynamic> toJson() => _$LinkCreateToJson(this);

  @override
  String toString() {
    return 'LinkCreate{target: $target, linkType: $linkType, password: $password}';
  }
}
