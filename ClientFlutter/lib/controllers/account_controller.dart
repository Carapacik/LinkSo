import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linkso/api/entity/account.dart';
import 'package:linkso/helpers/routes.dart';

class AccountController extends GetxController {
  static AccountController instance = Get.find();
  final RxBool isAuth = false.obs;
  final _key = 'auth-token';
  late GetStorage _box;

  @override
  void onInit() {
    super.onInit();
    _box = GetStorage();
    _getTokenFromBox();
  }

  Future _saveTokenToBox(String token) => _box.write(_key, token);

  Future _deleteTokenFromBox() => _box.write(_key, null);

  Future _getTokenFromBox() async {
    final _tokenFromBox = _box.read(_key) as String?;
    if (_tokenFromBox != null) {
      GetIt.instance.get<UserAccount>().token = _tokenFromBox;
      isAuth.value = true;
    }
  }

  Future<void> saveToken(String token) async {
    GetIt.instance.get<UserAccount>().token = token;
    await _saveTokenToBox(token);
    isAuth.value = true;
    Get.offAllNamed(statRoute);
  }

  Future<void> logout() async {
    GetIt.instance.get<UserAccount>().token = null;
    await _deleteTokenFromBox();
    isAuth.value = false;
    Get.offAllNamed(mainRoute);
  }
}
