import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/model/link_create.dart';
import 'package:linkso/resources/theme.dart';
import 'package:linkso/widgets/appbar.dart';
import 'package:linkso/widgets/default_button.dart';
import 'package:linkso/widgets/gradient_background.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNav(context, _scaffoldKey),
      body: const GradientBackground(
        child: Center(
          child: ResponsiveWidget(
            largeScreen: _GlassLarge(),
            smallScreen: _GlassSmall(),
          ),
        ),
      ),
    );
  }
}

class _GlassLarge extends StatelessWidget {
  const _GlassLarge({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 600,
      height: 280,
      borderRadius: 40,
      blur: 10,
      border: 1,
      alignment: Alignment.topCenter,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.3),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.3),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.makeYourLinkShorter,
              style: Theme.of(context).textTheme.b24,
            ),
            const SizedBox(height: 30),
            const Center(
              child: SizedBox(
                width: 500,
                child: _LinkForm(),
              ),
            ),
            const SizedBox(height: 30),
            const _ResultLink(),
          ],
        ),
      ),
    );
  }
}

class _GlassSmall extends StatelessWidget {
  const _GlassSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      borderRadius: 40,
      blur: 10,
      border: 1,
      alignment: Alignment.topCenter,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.3),
        ],
        stops: const [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.3),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.makeYourLinkShorter,
              style: Theme.of(context).textTheme.b24,
            ),
            const SizedBox(height: 20),
            const _LinkForm(),
            const SizedBox(height: 30),
            const _ResultLink(),
          ],
        ),
      ),
    );
  }
}

class _ResultLink extends StatelessWidget {
  const _ResultLink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final _key = linkController.receivedLinkKey.value;
      if (_key.isNotEmpty) {
        final fullLink = "${linkController.baseUri}/$_key";
        return Center(
          child: ResponsiveWidget.isSmallScreen(context)
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                      child: SelectableText(
                        fullLink,
                        style: Theme.of(context).textTheme.b18.copyWith(color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    const SizedBox(height: 20),
                    DefaultButton(
                      onPressed: () {
                        FlutterClipboard.copy(fullLink);
                      },
                      text: AppLocalizations.of(context)!.copy,
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                      child: SelectableText(
                        fullLink,
                        style: Theme.of(context).textTheme.b18.copyWith(color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    const SizedBox(width: 20),
                    DefaultButton(
                      onPressed: () {
                        FlutterClipboard.copy(fullLink);
                      },
                      text: AppLocalizations.of(context)!.copy,
                    ),
                  ],
                ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}

class _LinkForm extends StatefulWidget {
  const _LinkForm({Key? key}) : super(key: key);

  @override
  State<_LinkForm> createState() => _LinkFormState();
}

class _LinkFormState extends State<_LinkForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                const _LinkInputField(),
                const SizedBox(height: 20),
                _ShortenButton(formKey: _formKey),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: _LinkInputField()),
                const SizedBox(width: 20),
                _ShortenButton(formKey: _formKey),
              ],
            ),
    );
  }
}

class _LinkInputField extends StatelessWidget {
  const _LinkInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: linkController.textController,
      maxLength: 128,
      validator: (value) {
        if (value!.isEmpty) {
          return AppLocalizations.of(context)!.requiredLink;
        }
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
      onPressed: () async {
        final form = _formKey.currentState!;
        if (form.validate()) {
          form.save();
          final _receivedLinkInfo = await linkController.remoteDataSource.createLink(
            LinkCreate(target: linkController.targetLink),
          );
          linkController.receivedLinkKey.value = _receivedLinkInfo.key;
        }
      },
      text: AppLocalizations.of(context)!.shorten,
    );
  }
}
