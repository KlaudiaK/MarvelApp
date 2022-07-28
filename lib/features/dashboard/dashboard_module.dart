import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/utils/navigation_paths.dart';
import '../dashboard/home/home_page.dart';
import '../dashboard/search/search_page.dart';
import 'detail/detail_page.dart';
import 'home/cubit/comic_cubit.dart';
import 'search/bloc/comic_search_bloc.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => ComicCubit(i())),
        Bind.factory((i) => ComicSearchBloc(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(NavigationPaths.simplePath,
            child: (context, args) => HomePage()),
        ChildRoute(NavigationPaths.searchPagePath,
            child: (context, args) => SearchPage()),
        ChildRoute(NavigationPaths.detailsPagePath,
            child: (context, args) => DetailsPage(id: args.queryParams['id'])),
      ];
}
