import 'package:linkso/model/link_create.dart';

abstract class RemoteDataSource {
  Future<LinkCreate> createLink(LinkCreate link);
}
