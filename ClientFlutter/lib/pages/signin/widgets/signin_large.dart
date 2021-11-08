import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/api/google_sign_in.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/helpers/routes.dart';
import 'package:linkso/resources/theme.dart';
import 'package:linkso/widgets/custom_card_container.dart';

import 'auth_form.dart';

class SignInPageLarge extends StatelessWidget {
  const SignInPageLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 50),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomCardContainer(
              borderRadius: 40,
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.signin,
                    style: Theme.of(context).textTheme.b24,
                  ),
                  const SizedBox(height: 20),
                  const AuthForm(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(statRoute);
            accountController.isAuth.value = true;
          },
          child: Text("Basic auth redirect"),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: signIn,
          child: const Text("Google"),
        ),
      ],
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();
    print(user?.email);
    Get.offAllNamed(statRoute);
  }
}
