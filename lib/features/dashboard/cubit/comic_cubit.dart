import 'package:bloc/bloc.dart';
import 'package:marvel_app/data/local/comic.dart';
import 'package:marvel_app/features/dashboard/cubit/search_comic_list_state.dart';
import 'package:meta/meta.dart';

import '../../../repository/comic_repository.dart';

import 'comic_detail_state.dart';
import 'comic_list_state.dart';

part 'comic_state.dart';

class ComicCubit extends Cubit<ComicState> {
  ComicCubit(this._comicRepository) : super(ComicInitial()) {
      getComicList();
  }
  final ComicRepository _comicRepository;

  Future<void> getComicDetail(String id) async {
    try {
      emit(ComicDetailLoading());
      final comic = await _comicRepository.getComicInfo(id: id);
      emit(ComicDetailLoaded(comic));
    } catch (e) {
      emit(ComicDetailError(e.toString()));
    }
  }

   Future<void> getComicList() async {
    try {
      emit(ComicListLoading());
      final comicList = await _comicRepository.getComicList();
      emit(ComicListLoaded(comicList));
    } catch (e) {
      emit(ComicListError(e.toString()));
    }
  }

  Future<void> searchComics(String query) async {
    try {
      emit(SearchComicListLoading());
      final comicList = await _comicRepository.searchComicList(query: query);
      emit(SearchComicListLoaded(comicList));
    } catch (e) {
      emit(SearchComicListError(e.toString()));
    }
  }
}
