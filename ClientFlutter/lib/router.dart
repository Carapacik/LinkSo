import 'package:flutter/material.dart';
import 'package:linkso/pages/clients/clients_page.dart';
import 'package:linkso/pages/overview/overview_page.dart';
import 'package:linkso/routing.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
