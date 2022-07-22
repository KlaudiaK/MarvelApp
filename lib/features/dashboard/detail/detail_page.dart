import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailsPage extends StatelessWidget {
  final String? id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate('/home'),
          child: Text('Navigate to Home Page'),
        ),
      ),
    );
  }
}
