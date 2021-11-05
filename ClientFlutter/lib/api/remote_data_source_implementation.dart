import 'package:dio/dio.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/api/rest_client.dart';
import 'package:linkso/model/link_access_request.dart';
import 'package:linkso/model/link_create_request.dart';
import 'package:linkso/model/link_create_response.dart';

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
  Future<String> checkAccess(LinkAccessRequest linkAccessRequest) {
    return _restClient.checkAccess(linkAccessRequest);
  }
}
