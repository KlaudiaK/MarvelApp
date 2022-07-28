import 'package:flutter/material.dart';
import 'package:marvel_app/features/dashboard/bottom_bar/bottom_bar.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: DashboardTabs(),
    );
  }
}

