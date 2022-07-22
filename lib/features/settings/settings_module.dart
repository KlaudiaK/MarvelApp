import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/settings/settings_page.dart';

import '../../di/di_module.dart';
import '../dashboard/dashboard_module.dart';

class SettingsModule extends Module {



  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SettingsPage()),
      ];
}
