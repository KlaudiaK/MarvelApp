import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/repository/comic_repository_interface.dart';

import '../network/api_client.dart';
import '../repository/comic_repository.dart';

class DIModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => DioClient(), export: true),
        Bind.lazySingleton<ComicRepositoryInterface>((i) => ComicRepository(api: i()),
            export: true),
      ];
}
