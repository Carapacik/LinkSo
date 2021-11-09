import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:linkso/model/error_detail.dart';
import 'package:linkso/model/link_access_request.dart';
import 'package:linkso/model/link_create_request.dart';
import 'package:linkso/model/link_create_response.dart';
import 'package:linkso/model/login_request.dart';
import 'package:linkso/model/register_request.dart';

import 'entity/api_response.dart';
import 'remote_data_source.dart';
import 'rest_client.dart';

class RemoteDataSourceImplementation implements RemoteDataSource {
  final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10).inMilliseconds,
      receiveTimeout: const Duration(minutes: 1).inMilliseconds,
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  late RestClient _restClient;

  RemoteDataSourceImplementation() {
    _restClient = RestClient(_dio, baseUrl: "http://localhost:5000/api/");

    // для отключение SSL сертификата
    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
  }

  @override
  Future<LinkCreateResponse> createLink(LinkCreateRequest link) {
    return _restClient.createLink(link);
  }

  @override
  Future<void> deleteLink(String key) {
    return _restClient.deleteLink(key);
  }

  @override
  Future<String> login(LoginRequest loginRequest) {
    throw UnimplementedError();
  }

  @override
  Future<String> register(RegisterRequest registerRequest) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> checkAccess(LinkAccessRequest linkAccessRequest) async {
    ErrorDetail? errorDetail;

    final successData = await _restClient.checkAccess(linkAccessRequest).catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final _response = (obj as DioError).response;
          errorDetail = ErrorDetail.fromJson(jsonDecode(_response?.data as String) as Map<String, dynamic>);
          return errorDetail!.detail;
        default:
      }
    });

    final bool successResponse = errorDetail == null;
    return ApiResponse<String>(
      successResponse: successResponse,
      errorDetail: errorDetail,
      data: successResponse ? jsonDecode(successData) as String : null,
    );
  }
}
