import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String? id;
  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Page')),
      body: const Center(
        child: Text('This is details page'),
      ),
    );
  }
}
