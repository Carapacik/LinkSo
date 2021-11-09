import 'package:json_annotation/json_annotation.dart';

part 'error_detail.g.dart';

@JsonSerializable()
class ErrorDetail {
  final int status;
  final String detail;

  ErrorDetail({
    required this.status,
    required this.detail,
  });

  factory ErrorDetail.fromJson(Map<String, dynamic> json) => _$ErrorDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailToJson(this);

  @override
  String toString() {
    return 'ErrorDetail{status: $status, detail: $detail}';
  }
}
