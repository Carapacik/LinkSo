import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/model/link_create.dart';
import 'package:linkso/resources/palette.dart';
import 'package:linkso/resources/theme.dart';
import 'package:linkso/widgets/appbar.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNav(context, _scaffoldKey),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.lightGradient), // тут брать из темы
        child: Center(
          child: GlassmorphicContainer(
            width: 600,
            height: 250,
            borderRadius: 15,
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
              padding: const EdgeInsets.all(20),
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
                  Obx(() {
                    final _link = linkController.receivedLinkKey.value;
                    if (_link != "") {
                      return Text("linkso.su/$_link", style: const TextStyle(fontSize: 20),);
                    } else {
                      return const SizedBox();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LinkForm extends StatefulWidget {
  const _LinkForm({Key? key}) : super(key: key);

  @override
  State<_LinkForm> createState() => _LinkFormState();
}

class _LinkFormState extends State<_LinkForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: TextFormField(
              controller: controller,
              maxLength: 128,
              validator: (value) {
                if (value!.isEmpty) {
                  return "";
                }
                return null;
              },
              onSaved: (value) {},
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                final form = _formKey.currentState!;
                if (form.validate()) {
                  form.save();
                  final _receivedLinkInfo =
                  await RemoteDataSourceImplementation().createLink(LinkCreate(target: "https://youtu.be/dQw4w9WgXcQ"));
                  linkController.receivedLinkKey.value = _receivedLinkInfo.key;
                }
              },
              child: const Text("Shorten"),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
