import 'package:flutter/material.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/pages/password_link/widgets/password_button_submit.dart';
import 'package:linkso/pages/password_link/widgets/password_text_field.dart';

class PasswordLinkPage extends StatefulWidget {
  const PasswordLinkPage({Key? key}) : super(key: key);

  @override
  State<PasswordLinkPage> createState() => _PasswordLinkPageState();
}

class _PasswordLinkPageState extends State<PasswordLinkPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController? _textEditingController;
  String? key;

  @override
  void initState() {
    super.initState();
    final uriBase = Uri.base;
    if (uriBase.pathSegments.length > 1) {
      key = uriBase.pathSegments[1];
    }
    print(key ?? "key is null");
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: Form(
            key: _formKey,
            child: ResponsiveWidget.isSmallScreen(context)
                ? Column(
                    children: [
                      PasswordTextField(textEditingController: _textEditingController),
                      const SizedBox(height: 20),
                      PasswordButtonSubmit(formKey: _formKey),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: PasswordTextField(textEditingController: _textEditingController)),
                      const SizedBox(width: 20),
                      PasswordButtonSubmit(formKey: _formKey),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
  }
}
