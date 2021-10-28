import 'package:dio/dio.dart';
import 'package:linkso/model/link_create.dart';
import 'package:linkso/model/link_info.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("linkmanager/create")
  Future<LinkInfo> createLink(@Body() LinkCreate link);
}
