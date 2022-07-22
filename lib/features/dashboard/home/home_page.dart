import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/utils/navigation_paths.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  //TODO Create home page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Modular.to.navigate('${NavigationPaths.dashboardModulePath}${NavigationPaths.searchPagePath}'),
              child: Text('Navigate to search Page'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Modular.to.navigate('${NavigationPaths.dashboardModulePath}${NavigationPaths.simpleDetailsPagePath}/1'),
              child: Text('Navigate to detail Page'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.navigate(NavigationPaths.setingsModulePath),
              child: Text('Navigate to settings Page'),
            ),
          ],
        ),
      ),
    );
  }
}
