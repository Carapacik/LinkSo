import 'package:linkso/model/link_create.dart';
import 'package:linkso/model/link_info.dart';

abstract class RemoteDataSource {
  Future<LinkInfo> createLink(LinkCreate link);
}
