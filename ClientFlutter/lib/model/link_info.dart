import 'package:json_annotation/json_annotation.dart';

part 'link_info.g.dart';

@JsonSerializable()
class LinkInfo {
  String target;
  int linkType;
  String key;

  LinkInfo({
    required this.target,
    this.linkType = 0,
    required this.key,
  });

  factory LinkInfo.fromJson(Map<String, dynamic> json) => _$LinkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LinkInfoToJson(this);

  @override
  String toString() {
    return 'LinkInfo{target: $target, linkType: $linkType, key: $key}';
  }
}
