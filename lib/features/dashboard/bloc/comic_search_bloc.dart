import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marvel_app/data/local/comic.dart';

import '../../../repository/comic_repository.dart';

part 'comic_search_event.dart';
part 'comic_search_state.dart';

class ComicSearchBloc extends Bloc<ComicSearchEvent, ComicSearchState> {
  final ComicRepository _comicRepository;
  ComicSearchBloc(this._comicRepository) : super(ComicSearchInitial()) {
    on<OnTitleChanged>(_onTitleChanged);
  }

  void _onTitleChanged(
      OnTitleChanged event, Emitter<ComicSearchState> emit) async {
    log("In on title changed");
    try {
      emit(ComicSearchLoading());
      final comicList =
          await _comicRepository.searchComicList(query: event.query);
      log(comicList.toString());
      emit(ComicSearchLoaded(comicList));
    } catch (e) {
      emit(ComicSearchError());
    }
  }
}
