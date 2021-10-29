import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:linkso/widgets/default_button.dart';

class PasswordButtonSubmit extends StatelessWidget {
  const PasswordButtonSubmit({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: () async {
        final form = _formKey.currentState!;
        if (form.validate()) {
          form.save();
          // TODO: добавить запрос на проверку пароля
          // await linkController.remoteDataSource.checkPassword(
          //   linkController.passwordForLink,
          // );
        }
      },
      text: AppLocalizations.of(context)!.go,
    );
  }
}
