import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Splash Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Modular.to.navigate('/dashboard-module/'),
          child: Text('Navigate to home Page'),
        ),
      ),
    );
  }
}
