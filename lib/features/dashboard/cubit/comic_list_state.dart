
import 'package:flutter/cupertino.dart';

import '../../../data/local/comic.dart';
import 'comic_cubit.dart';

@immutable
abstract class ComicListState extends ComicState {
  ComicListState();
}

class ComicListInitial extends ComicListState {
  ComicListInitial();
}

class ComicListLoading extends ComicListState {
  ComicListLoading();
}

class ComicListLoaded extends ComicListState {
  final List<ComicItem> comic;
  ComicListLoaded(this.comic);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComicListLoaded && o.comic == comic;
  }

  @override
  int get hashCode => comic.hashCode;
}

class ComicListError extends ComicListState {
  final String message;
  ComicListError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComicListError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
