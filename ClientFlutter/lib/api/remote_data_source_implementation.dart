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
import 'exceptions.dart';
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
  Future<ApiResponse<String>> checkAccess(LinkAccessRequest linkAccessRequest) async {
    ErrorDetail? _errorDetail;

    final successData = await _restClient.checkAccess(linkAccessRequest).catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final _response = (obj as DioError).response;
          _errorDetail = ErrorDetail.fromJson(jsonDecode(_response?.data as String) as Map<String, dynamic>);
          return _errorDetail!.detail;
        default:
          return ServerConnectionException();
      }
    });

    final bool successResponse = _errorDetail == null;
    return ApiResponse<String>(
      successResponse: successResponse,
      errorDetail: _errorDetail,
      data: successResponse ? jsonDecode(successData) as String : null,
    );
  }

  @override
  Future<ApiResponse<LinkCreateResponse>> createLink(LinkCreateRequest link) async {
    ErrorDetail? _errorDetail;

    final successData = await _restClient.createLink(link).catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final _response = (obj as DioError).response;
          _errorDetail = ErrorDetail.fromJson(jsonDecode(_response?.data as String) as Map<String, dynamic>);
          return _errorDetail!.detail;
        default:
          return ServerConnectionException();
      }
    });

    final bool successResponse = _errorDetail == null;
    return ApiResponse<LinkCreateResponse>(
      successResponse: successResponse,
      errorDetail: _errorDetail,
      data: successResponse ? successData : null,
    );
  }

  @override
  Future<ApiResponse> deleteLink(String key) async {
    ErrorDetail? _errorDetail;

    final successData = await _restClient.deleteLink(key).catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final _response = (obj as DioError).response;
          _errorDetail = ErrorDetail.fromJson(jsonDecode(_response?.data as String) as Map<String, dynamic>);
          return _errorDetail!.detail;
        default:
          return ServerConnectionException();
      }
    });

    final bool successResponse = _errorDetail == null;
    return ApiResponse(
      successResponse: successResponse,
      errorDetail: _errorDetail,
      data: successResponse ? successData : null,
    );
  }

  @override
  Future<ApiResponse<String>> login(LoginRequest loginRequest) async {
    ErrorDetail? _errorDetail;

    final successData = await _restClient.login(loginRequest).catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final _response = (obj as DioError).response;
          _errorDetail = ErrorDetail.fromJson(jsonDecode(_response?.data as String) as Map<String, dynamic>);
          return _errorDetail!.detail;
        default:
          return ServerConnectionException();
      }
    });

    final bool successResponse = _errorDetail == null;
    return ApiResponse<String>(
      successResponse: successResponse,
      errorDetail: _errorDetail,
      data: successResponse ? jsonDecode(successData) as String : null,
    );
  }

  @override
  Future<ApiResponse<String>> register(RegisterRequest registerRequest) async {
    ErrorDetail? _errorDetail;
    final successData = await _restClient.register(registerRequest).catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final _response = (obj as DioError).response;
          _errorDetail = ErrorDetail.fromJson(jsonDecode(_response?.data as String) as Map<String, dynamic>);
          return _errorDetail!.detail;
        default:
          return ServerConnectionException();
      }
    });

    final bool successResponse = _errorDetail == null;
    return ApiResponse<String>(
      successResponse: successResponse,
      errorDetail: _errorDetail,
      data: successResponse ? jsonDecode(successData) as String : null,
    );
  }
}
