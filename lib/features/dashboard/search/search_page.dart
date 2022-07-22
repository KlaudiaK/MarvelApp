import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/utils/navigation_paths.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
//TODO Create search page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate(NavigationPaths.dashboardModulePath),
          child: Text('Navigate to home Page'),
        ),
      ),
    );
  }
}
