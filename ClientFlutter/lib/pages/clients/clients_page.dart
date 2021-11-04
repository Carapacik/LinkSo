import 'package:flutter/material.dart';
import 'package:linkso/pages/clients/widgets/clients_table.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: ClientsTable(),
    );
  }
}
