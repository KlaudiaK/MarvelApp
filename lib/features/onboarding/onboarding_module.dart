import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/onboarding/splash_page.dart';
import 'package:marvel_app/features/settings/settings_module.dart';

import '../dashboard/dashboard_module.dart';
import '../dashboard/home/home_page.dart';
import '../dashboard/search/search_page.dart';

class OnboardingModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/dashboard-module', module: DashboardModule()),
        ModuleRoute('/settings-module', module: SettingsModule()),
      ];
}
