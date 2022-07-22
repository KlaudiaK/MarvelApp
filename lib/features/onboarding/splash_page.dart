import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/utils/navigation_paths.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
//TODO Create splash page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate(NavigationPaths.dashboardModulePath),
          child: Text('Navigate to home Page'),
        ),
      ),
    );
  }
}
