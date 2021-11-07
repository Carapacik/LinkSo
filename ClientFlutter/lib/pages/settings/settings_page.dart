import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/api/google_sign_in.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/helpers/routes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async {
            GoogleSignInApi.logout();
            accountController.isAuth.value = false;
            Get.offAllNamed(mainRoute);
          },
          child: const Padding(
            padding: EdgeInsets.all(15),
            child: Text("Logout Google"),
          ),
        ),
      ],
    );
  }
}
