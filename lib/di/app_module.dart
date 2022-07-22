import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/features/onboarding/splash_page.dart';
import 'package:marvel_app/network/api_client.dart';
import 'package:marvel_app/repository/comic_repository.dart';

import '../features/dashboard/detail/detail_page.dart';
import '../features/dashboard/home/home_page.dart';
import '../features/dashboard/search/search_page.dart';
import '../features/settings/settings_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => DioClient(), export: true),
        Bind.singleton((i) => ComicRepository(api: i.args.data), export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
        ChildRoute('/search', child: (context, args) => const SearchPage()),
        ChildRoute('/detail/:id',
            child: (context, args) => DetailsPage(id: args.queryParams['id'])),
        ChildRoute('/settings', child: (context, args) => const SettingsPage()),
      ];
}
