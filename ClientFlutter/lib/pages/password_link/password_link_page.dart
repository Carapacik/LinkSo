import 'package:flutter/material.dart';
import 'package:linkso/pages/password_link/widgets/password_link_large.dart';
import 'package:linkso/widgets/custom_scaffold.dart';

class PasswordLinkPage extends StatelessWidget {
  const PasswordLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      largeScreen: const PasswordLinkPageLarge(),
    );
  }
}
