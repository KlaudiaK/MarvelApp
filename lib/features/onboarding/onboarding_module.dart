import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/onboarding/splash_page.dart';
import 'package:marvel_app/utils/navigation_paths.dart';


class OnboardingModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(NavigationPaths.simplePath, child: (context, args) => const SplashPage()),
      ];
}
