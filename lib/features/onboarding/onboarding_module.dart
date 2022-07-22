import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/onboarding/splash_page.dart';


class OnboardingModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
      ];
}
