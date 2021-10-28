import 'package:flutter/widgets.dart';
import 'package:linkso/controllers.dart';
import 'package:linkso/router.dart';
import 'package:linkso/routing.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      initialRoute: overviewPageRoute,
      onGenerateRoute: generateRoute,
    );
