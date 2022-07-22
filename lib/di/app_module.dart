import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/di/di_module.dart';
import 'package:marvel_app/features/onboarding/onboarding_module.dart';
import 'package:marvel_app/network/api_client.dart';
import 'package:marvel_app/repository/comic_repository.dart';


class AppModule extends Module {
  @override
  List<Module> get imports => [
        DIModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: OnboardingModule()),
      ];
}
