import 'package:dio/dio.dart';
import 'package:linkso/model/link_create.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "http://localhost:5000/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("linkmanager/create")
  Future<LinkCreate> createLink(@Body() LinkCreate link);
}
