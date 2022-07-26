import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/utils/navigation_paths.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  //TODO Create settings page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Settings Page')),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Modular.to.navigate(NavigationPaths.dashboardModulePath),
            child: Text('Navigate to home Page'),
          ),
        ));
  }
}
