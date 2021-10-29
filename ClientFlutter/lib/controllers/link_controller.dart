import 'package:get/get.dart';
import 'package:linkso/api/remote_data_source.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';

class LinkController extends GetxController {
  static LinkController instance = Get.find();
  RxString receivedLinkKey = "".obs;
  String targetLink = "";
  String passwordForLink = "";

  final baseUri = "http://localhost:5000";

  late RemoteDataSource remoteDataSource;

  @override
  void onInit() {
    super.onInit();
    remoteDataSource = RemoteDataSourceImplementation();
  }
}
