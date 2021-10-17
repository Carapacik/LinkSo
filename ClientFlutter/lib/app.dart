import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkso/layout.dart';
import 'package:linkso/resources/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: SiteLayout(),
    );
  }
}
