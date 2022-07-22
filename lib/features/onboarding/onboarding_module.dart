import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/onboarding/splash_page.dart';
import 'package:marvel_app/features/settings/settings_module.dart';

import '../../di/di_module.dart';
import '../dashboard/dashboard_module.dart';
import '../dashboard/home/home_page.dart';
import '../dashboard/search/search_page.dart';

class OnboardingModule extends Module {
  @override
  List<Module> get imports => [
        DIModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
    
      ];
}
