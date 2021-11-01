import 'package:flutter/material.dart';

class PasswordLinkPageLarge extends StatefulWidget {
  const PasswordLinkPageLarge({Key? key}) : super(key: key);

  @override
  _PasswordLinkPageLargeState createState() => _PasswordLinkPageLargeState();
}

class _PasswordLinkPageLargeState extends State<PasswordLinkPageLarge> {
  late String? key;

  @override
  void initState() {
    super.initState();
    final uriBase = Uri.base;
    if (uriBase.pathSegments.length > 1) {
      key = uriBase.pathSegments[1];
    }
    print(key ?? "key is null");
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(key ?? "key is null"));
  }
}
