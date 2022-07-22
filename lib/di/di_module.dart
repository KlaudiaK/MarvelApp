import 'package:flutter_modular/flutter_modular.dart';

import '../network/api_client.dart';
import '../repository/comic_repository.dart';

class DIModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => DioClient(), export: true),
        Bind.lazySingleton((i) => ComicRepository(api: i.args.data),
            export: true),
      ];
}
