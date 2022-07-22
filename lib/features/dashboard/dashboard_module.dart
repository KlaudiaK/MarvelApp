import 'package:flutter_modular/flutter_modular.dart';

import '../../di/di_module.dart';
import '../dashboard/home/home_page.dart';
import '../dashboard/search/search_page.dart';
import '../settings/settings_module.dart';
import 'detail/detail_page.dart';

class DashboardModule extends Module {
  @override
  List<Module> get imports => [
        DIModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/search', child: (context, args) => const SearchPage()),
        ChildRoute('/detail/:id',
            child: (context, args) => DetailsPage(id: args.queryParams['id'])),
      ];
}
