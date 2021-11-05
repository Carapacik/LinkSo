import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/api/google_sign_in.dart';
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
            Get.offAllNamed(authRoute);
          },
          child: const Text("Logout Google"),
        ),
        const SizedBox(height: 30),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(mainRoute);
          },
          child: const Text("Short link"),
        ),
      ],
    );
  }
}
