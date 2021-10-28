import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:linkso/api/google_sign_in.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/model/link_create.dart';
import 'package:linkso/routing.dart';
import 'package:linkso/widgets/custom_text.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            final createLink =
                await RemoteDataSourceImplementation().createLink(LinkCreate(target: "https://youtu.be/dQw4w9WgXcQ"));
            print(createLink.toString());
          },
          child: const Text("Get link"),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () async {
            GoogleSignInApi.logout();
            Get.offAllNamed(authenticationPageRoute);
          },
          child: const Text("Logout Google"),
        ),
        const SizedBox(height: 30),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(mainPageRoute);
          },
          child: const Text("Short link"),
        ),
      ],
    );
  }
}
