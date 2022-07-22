import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/settings/settings_page.dart';
import 'package:marvel_app/utils/navigation_paths.dart';


class SettingsModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(NavigationPaths.simplePath, child: (context, args) => const SettingsPage()),
      ];
}
