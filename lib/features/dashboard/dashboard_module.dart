import 'package:flutter_modular/flutter_modular.dart';

import '../dashboard/home/home_page.dart';
import '../dashboard/search/search_page.dart';
import 'detail/detail_page.dart';

class DashboardModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/search', child: (context, args) => const SearchPage()),
        ChildRoute('/detail/:id',
            child: (context, args) => DetailsPage(id: args.queryParams['id'])),
      ];
}
