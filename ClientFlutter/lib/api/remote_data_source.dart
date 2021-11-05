import 'package:linkso/model/link_access_request.dart';
import 'package:linkso/model/link_create_request.dart';
import 'package:linkso/model/link_create_response.dart';

abstract class RemoteDataSource {
  Future<LinkCreateResponse> createLink(LinkCreateRequest link);

  Future<void> deleteLink(String key);

  Future<String> checkAccess(LinkAccessRequest linkAccessRequest);
}
