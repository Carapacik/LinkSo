import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:linkso/resources/theme.dart';

import '../../../controller_instances.dart';

class PasswordCheckBox extends StatefulWidget {
  const PasswordCheckBox({Key? key}) : super(key: key);

  @override
  State<PasswordCheckBox> createState() => _PasswordCheckBoxState();
}

class _PasswordCheckBoxState extends State<PasswordCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        AppLocalizations.of(context)!.password,
        style: Theme.of(context).textTheme.m16,
      ),
      value: mainPageController.checkBool.value,
      onChanged: (value) {
        setState(() {
          mainPageController.changeCheckBoolValue();
        });
      },
    );
  }
}
