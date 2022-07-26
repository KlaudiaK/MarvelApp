import 'package:bloc/bloc.dart';
import 'package:marvel_app/features/dashboard/cubit/comic_cubit.dart';
import 'package:meta/meta.dart';

import '../../../../data/local/comic.dart';
import '../../../../repository/comic_repository.dart';

part 'search_comic_list_state.dart';

class SearchComicListCubit extends Cubit<SearchComicListState> {
  final ComicRepository _comicRepository;
  SearchComicListCubit(this._comicRepository) : super(SearchComicListInitial());
/*
  Future<void> searchComics(String query) async {
    try {
      emit(SearchComicListLoading());
      final comicList = await _comicRepository.searchComicList(query: query);
      emit(SearchComicListLoaded(comicList));
    } catch (e) {
      emit(SearchComicListError(e.toString()));
    }
  }
  */
}
