import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/local/comic.dart';
import '../../../../repository/comic_repository.dart';

part 'comic_detail_state.dart';

class ComicDetailCubit extends Cubit<ComicDetailState> {
  final ComicRepository _comicRepository;

  ComicDetailCubit(this._comicRepository) : super(ComicDetailInitial());
  Future<void> getComicDetail(String id) async {
    try {
      emit(ComicDetailLoading());
      final comic = await _comicRepository.getComicInfo(id: id);
      emit(ComicDetailLoaded(comic));
    } catch (e) {
      emit(ComicDetailError(e.toString()));
    }
  }
}
