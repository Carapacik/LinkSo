import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';
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
      height: 270,
      borderRadius: 40,
      blur: 10,
      border: 1,
      alignment: Alignment.topCenter,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.3),
          const Color(0xFFFFFFFF).withOpacity(0.2),
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
              "Make your link shorter",
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
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      borderRadius: 40,
      blur: 10,
      border: 1,
      alignment: Alignment.topCenter,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.3),
          const Color(0xFFFFFFFF).withOpacity(0.2),
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
              "Make your link shorter",
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
        final fullLink = "linkso.su/$_key";
        return Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
                child: SelectableText(
                  fullLink,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(width: 20),
              DefaultButton(
                onPressed: () {
                  FlutterClipboard.copy(fullLink);
                },
                text: "Copy",
              ),
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
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
              mainAxisAlignment: MainAxisAlignment.center,
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: linkController.textController,
        maxLength: 128,
        validator: (value) {
          if (value!.isEmpty) {
            return "Link must be not null";
          }
          return null;
        },
        onSaved: (value) {
          linkController.targetLink = value!;
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Your link",
          counterText: "",
          counterStyle: TextStyle(height: double.minPositive),
        ),
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
          final _receivedLinkInfo =
              await RemoteDataSourceImplementation().createLink(LinkCreate(target: linkController.targetLink));
          linkController.receivedLinkKey.value = _receivedLinkInfo.key;
        }
      },
      text: "Shorten",
    );
  }
}
