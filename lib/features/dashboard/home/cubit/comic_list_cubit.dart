import 'package:bloc/bloc.dart';
import 'package:marvel_app/repository/comic_repository.dart';
import 'package:meta/meta.dart';

import '../../../../data/local/comic.dart';

part 'comic_list_state.dart';

class ComicListCubit extends Cubit<ComicListState> {
  final ComicRepository _comicRepository;

  ComicListCubit(this._comicRepository) : super(ComicListInitial());

  Future<void> getComicList() async {
    try {
      emit(ComicListLoading());
      final comicList = await _comicRepository.getComicList();
      emit(ComicListLoaded(comicList));
    } catch (e) {
      emit(ComicListError(e.toString()));
    }
  }

}
