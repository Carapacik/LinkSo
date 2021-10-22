import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInApi {
  Map? userData;

  Future login() async {
    final result = await FacebookAuth.i.login(permissions: ["public_profile", "email"]);

    if (result == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );
      userData = requestData;
      // notify
    }
  }

  Future logout() async {
    await FacebookAuth.i.logOut();
    userData = null;
    // notify
  }
}
