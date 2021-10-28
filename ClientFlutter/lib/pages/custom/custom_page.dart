import 'package:flutter/material.dart';

class CustomPageSample extends StatelessWidget {
  const CustomPageSample({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(data)),
    );
  }
}
