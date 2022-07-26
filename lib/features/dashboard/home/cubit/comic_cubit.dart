import 'package:bloc/bloc.dart';

import 'package:marvel_app/features/dashboard/response_status.dart';
import 'package:meta/meta.dart';

import '../../../../repository/comic_repository.dart';

import 'comic_list_state.dart';

class ComicCubit extends Cubit<ComicListState> {
  ComicCubit(this._comicRepository) : super(const ComicListState());
  final ComicRepository _comicRepository;

  Future<void> getComicList() async {
    if (isClosed) return;
    try {
      emit(state.copyWith(comicListStatus: ResponseStatus.loading));
      final comicList = await _comicRepository.getComicList();
      emit(state.copyWith(
          comicListStatus: ResponseStatus.success, comicList: comicList));
    } catch (e) {
      emit(state.copyWith(comicListStatus: ResponseStatus.failure));
    }
  }
}
