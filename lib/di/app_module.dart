import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/di/di_module.dart';
import 'package:marvel_app/features/dashboard/dashboard_module.dart';
import 'package:marvel_app/features/onboarding/onboarding_module.dart';
import 'package:marvel_app/features/settings/settings_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        DIModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: OnboardingModule()),
        ModuleRoute('/dashboard-module', module: DashboardModule()),
        ModuleRoute('/settings-module', module: SettingsModule()),
      ];
}
