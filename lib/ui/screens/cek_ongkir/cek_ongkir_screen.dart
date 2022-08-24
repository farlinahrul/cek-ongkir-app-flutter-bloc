import 'package:flutter/material.dart';
import 'package:startercode_project/ui/screens/cek_ongkir/pages/Internasional_page.dart';

import 'pages/domestik/domestik_screen.dart';

class CekOngkirPage extends StatelessWidget {
  const CekOngkirPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Domestik",
              ),
              Tab(text: "Internasional"),
            ],
          ),
          title: const Text('Cek Ongkir'),
        ),
        body: const TabBarView(
          children: [
            DomestikPage(),
            InternasionalPage(),
          ],
        ),
      ),
    );
  }
}
