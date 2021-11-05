import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:linkso/controller_instances.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/widgets/default_button.dart';

class LinkForm extends StatefulWidget {
  const LinkForm({Key? key}) : super(key: key);

  @override
  State<LinkForm> createState() => _LinkFormState();
}

class _LinkFormState extends State<LinkForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                _LinkInputField(textEditingController: _textEditingController),
                const SizedBox(height: 20),
                _ShortenButton(formKey: _formKey),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _LinkInputField(textEditingController: _textEditingController)),
                const SizedBox(width: 20),
                _ShortenButton(formKey: _formKey),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _textEditingController?.dispose();
    super.dispose();
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
    return TextFormField(
      controller: textEditingController,
      maxLength: 128,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.requiredLink;
        }
        final regExp = RegExp(r'^(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
        if (regExp.hasMatch(value)) {
          return AppLocalizations.of(context)!.incorrectLink;
        }
        // TODO: проверка ссылка с нашего сайта
        return null;
      },
      onSaved: (value) {
        linkController.targetLink = value!;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        filled: true,
        hintText: AppLocalizations.of(context)!.yourLink,
      ),
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
