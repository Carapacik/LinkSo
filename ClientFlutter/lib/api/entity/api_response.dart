import 'package:linkso/model/error_detail.dart';

class ApiResponse<T> {
  ApiResponse({
    required this.successResponse,
    required this.data,
    this.errorDetail,
  });

  final bool successResponse;
  final ErrorDetail? errorDetail;
  final T? data;
}
