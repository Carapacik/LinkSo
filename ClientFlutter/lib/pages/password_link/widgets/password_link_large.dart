import 'package:flutter/material.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/pages/password_link/widgets/password_form.dart';

class PasswordLinkPageLarge extends StatefulWidget {
  const PasswordLinkPageLarge({Key? key}) : super(key: key);

  @override
  _PasswordLinkPageLargeState createState() => _PasswordLinkPageLargeState();
}

class _PasswordLinkPageLargeState extends State<PasswordLinkPageLarge> {
  @override
  void initState() {
    super.initState();
    final uriBase = Uri.base;
    if (uriBase.pathSegments.length > 1) {
      passwordLinkPageController.key.value = uriBase.pathSegments[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: PasswordForm());
  }
}
