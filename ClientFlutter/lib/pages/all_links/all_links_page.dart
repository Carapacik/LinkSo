import 'package:flutter/material.dart';
import 'package:linkso/pages/all_links/widgets/all_links_table.dart';

class AllLinksPage extends StatelessWidget {
  const AllLinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: AllLinksTable(),
    );
  }
}