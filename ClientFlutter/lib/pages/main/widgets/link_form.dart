import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/pages/main/widgets/password_check_box.dart';
import 'package:linkso/widgets/custom_text_field.dart';
import 'package:linkso/widgets/default_button.dart';

class LinkForm extends StatefulWidget {
  const LinkForm({Key? key}) : super(key: key);

  @override
  State<LinkForm> createState() => _LinkFormState();
}

class _LinkFormState extends State<LinkForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController? _linkController;
  late TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    _linkController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                _LinkInputField(textEditingController: _linkController),
                const SizedBox(height: 20),
                _ShortenButton(formKey: _formKey),
                const PasswordCheckBox(),
                Obx(() {
                  if (mainPageController.checkBool.value) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: _PasswordInputField(textEditingController: _passwordController),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ],
            )
          : Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _LinkInputField(textEditingController: _linkController)),
                    const SizedBox(width: 20),
                    _ShortenButton(formKey: _formKey),
                  ],
                ),
                const PasswordCheckBox(),
                Obx(() {
                  if (mainPageController.checkBool.value) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: _PasswordInputField(textEditingController: _passwordController),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                }),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _linkController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }
}

class _PasswordInputField extends StatelessWidget {
  const _PasswordInputField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textEditingController: textEditingController,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.requiredPassword;
        }
        final regExp = RegExp(r'^(?=.*[0-9]).{5,30}$');
        if (!regExp.hasMatch(value)) {
          return AppLocalizations.of(context)!.incorrectPassword;
        }
        return null;
      },
      onSaved: (value) {
        mainPageController.passwordLink = value;
      },
      hintText: AppLocalizations.of(context)!.yourPassword,
    );
  }
}

class _LinkInputField extends StatelessWidget {
  const _LinkInputField({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      textEditingController: textEditingController,
      maxLength: 250,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.requiredLink;
        }
        final regExp =
            RegExp(r'^http(s)?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$');
        if (!regExp.hasMatch(value)) {
          return AppLocalizations.of(context)!.incorrectLink;
        }
        // TODO: проверка ссылка с нашего сайта
        return null;
      },
      onSaved: (value) {
        mainPageController.targetLink = value!;
      },
      hintText: AppLocalizations.of(context)!.yourLink,
    );
  }
}

class _ShortenButton extends StatelessWidget {
  const _ShortenButton({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onPressed: () => mainPageController.getResultKey(_formKey.currentState!),
      text: AppLocalizations.of(context)!.shorten,
    );
  }
}
