import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/api/google_sign_in.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/helpers/routes.dart';

class SignInPageLarge extends StatelessWidget {
  const SignInPageLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: signIn,
            child: Text("Google"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.offAllNamed(statRoute);
              accountController.isAuth.value = true;
            },
            child: Text("Basic"),
          ),
        ],
      ),
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();
    print(user?.email);
    Get.offAllNamed(statRoute);
  }
}
