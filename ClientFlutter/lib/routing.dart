const mainRoute = "/main";
const authRoute = "/auth";
const statRoute = "/stat";
const passwordLinkRoute = "/p";
const notFoundRoute = "/not-found";

const authenticationPageDisplayName = "Log out";
const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const clientsPageDisplayName = "Clients";
const clientsPageRoute = "/clients";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(clientsPageDisplayName, clientsPageRoute),
  MenuItem(authenticationPageDisplayName, authRoute),
];
