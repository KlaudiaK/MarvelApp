

import 'package:flutter/cupertino.dart';

import '../../../data/local/comic.dart';
import 'comic_cubit.dart';

@immutable
abstract class SearchComicListState extends ComicState {
  SearchComicListState();
}

class SearchComicListInitial extends ComicState {
  SearchComicListInitial();
}

class SearchComicListLoading extends ComicState {
  SearchComicListLoading();
}

class SearchComicListLoaded extends ComicState {
  final List<ComicItem?> comicList;
  SearchComicListLoaded(this.comicList);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchComicListLoaded && o.comicList == comicList;
  }

  @override
  int get hashCode => comicList.hashCode;
}

class SearchComicListError extends ComicState {
  final String message;
  SearchComicListError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SearchComicListError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
