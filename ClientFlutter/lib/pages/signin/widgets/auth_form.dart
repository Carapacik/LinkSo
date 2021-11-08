import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:linkso/helpers/regex.dart';
import 'package:linkso/widgets/custom_text_field.dart';
import 'package:linkso/widgets/default_button.dart';

import '../../../controller_instances.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController? _emailController;
  late TextEditingController? _loginController;
  late TextEditingController? _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _EmailTextField(controller: _emailController),
          const SizedBox(height: 30),
          _LoginTextField(controller: _loginController),
          const SizedBox(height: 30),
          _PasswordTextField(controller: _passwordController),
          const SizedBox(height: 30),
          DefaultButton(
            onPressed: () => signInPageController.signIn(_formKey.currentState!),
            text: AppLocalizations.of(context)!.login,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController?.dispose();
    _loginController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.requiredEmail;
        }
        if (!emailRegex.hasMatch(value)) {
          return AppLocalizations.of(context)!.incorrectEmail;
        }
        return null;
      },
      onSaved: (value) {
        signInPageController.email = value;
      },
      hintText: AppLocalizations.of(context)!.yourEmail,
    );
  }
}

class _LoginTextField extends StatelessWidget {
  const _LoginTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.requiredLogin;
        }
        // TODO: regex мб добавить
        return null;
      },
      onSaved: (value) {
        signInPageController.login = value;
      },
      hintText: AppLocalizations.of(context)!.yourLogin,
    );
  }
}

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.requiredPassword;
        }
        if (!passwordRegex.hasMatch(value)) {
          return AppLocalizations.of(context)!.incorrectPassword;
        }
        return null;
      },
      onSaved: (value) {
        signInPageController.password = value;
      },
      hintText: AppLocalizations.of(context)!.yourPassword,
    );
  }
}
