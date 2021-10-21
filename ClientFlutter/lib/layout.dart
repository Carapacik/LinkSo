import 'package:flutter/material.dart';
import 'package:linkso/helpers/responsiveness.dart';
import 'package:linkso/widgets/appbar.dart';
import 'package:linkso/widgets/large_screen.dart';
import 'package:linkso/widgets/side_menu.dart';
import 'package:linkso/widgets/small_screen.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      appBar: topNav(context, _scaffoldKey),
      drawer: const Drawer(child: SafeArea(child: SideMenu())),
      body: const ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
