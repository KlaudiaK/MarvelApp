import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate('/dashboard-module/'),
          child: Text('Navigate to home Page'),
        ),
      ),
    );
  }
}
