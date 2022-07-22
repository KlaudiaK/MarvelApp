import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body:  Center(
        child: Column(
          children: [
            ElevatedButton(
          onPressed: () => Modular.to.navigate('/search'),
          child: Text('Navigate to search Page'),
        ),
        ElevatedButton(
          onPressed: () => Modular.to.navigate('/detail/1'),
          child: Text('Navigate to detail Page'),
        ),
          ],
          ),
      ),
    );
  }
}
