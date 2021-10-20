
import 'package:dio/dio.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/api/rest_client.dart';
import 'package:linkso/model/link_create.dart';

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

    // (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };
  }

  @override
  Future<LinkCreate> createLink(LinkCreate link) {
    return _restClient.createLink(link);
  }
}