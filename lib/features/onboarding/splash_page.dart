import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/utils/navigation_paths.dart';
import 'package:marvel_app/utils/strings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Modular.to.navigate(NavigationPaths.dashboardModulePath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white.withAlpha(240),
        child: Center(
            child: Image.asset(StringResource.splash_screen_image_path)));
  }
}
