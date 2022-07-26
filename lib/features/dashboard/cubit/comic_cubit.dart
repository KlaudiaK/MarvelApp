import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../repository/comic_repository.dart';
import '../detail/cubit/comic_detail_cubit.dart';
import '../home/cubit/comic_list_cubit.dart';
import '../search/cubit/search_comic_list_cubit.dart';

part 'comic_state.dart';

class ComicCubit extends Cubit<ComicState> {
  ComicCubit(this._comicRepository) : super(ComicInitial());
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
      print("COMIC LIST"+ comicList.toString());
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
