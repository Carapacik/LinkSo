import 'package:flutter/material.dart';
import 'package:linkso/pages/clients/clients_page.dart';
import 'package:linkso/pages/drivers/drivers_page.dart';
import 'package:linkso/pages/overview/overview_page.dart';
import 'package:linkso/routing.dart';

Route generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPAge());
    case driversPageRoute:
      return _getPageRoute(DriverPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    default:
      return _getPageRoute(OverviewPAge());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
