import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:linkso/api/remote_data_source_implementation.dart';
import 'package:linkso/model/link_create.dart';
import 'package:linkso/model/link_info.dart';
import 'package:linkso/resources/theme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LinkInfo? _receivedLink;
  String? targetLink;
  final linkController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff701ebd),
              Color(0xFF873bcc),
              Color(0xFFfe4a97),
              Color(0xFFe17763),
            ],
          ),
        ),
        child: Center(
          child: GlassmorphicContainer(
            width: 700,
            height: 350,
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
                  Center(
                    child: SizedBox(
                      width: 500,
                      child: Form(
                        key: _formKey,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                controller: linkController,
                                maxLength: 128,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  targetLink = value;
                                },
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () async {
                                  final form = _formKey.currentState!;
                                  if (form.validate()) {
                                    form.save();
                                    _receivedLink = await RemoteDataSourceImplementation()
                                        .createLink(LinkCreate(target: "https://youtu.be/dQw4w9WgXcQ"));
                                    setState(() {});
                                    linkController.text = "linkso.su/${_receivedLink!.key}";
                                  }
                                },
                                child: const Text("Shorten"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  if (_receivedLink != null) Text("linkso.su/${_receivedLink!.key}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
