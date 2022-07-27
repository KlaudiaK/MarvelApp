import 'package:flutter/cupertino.dart';

import '../../../data/local/comic.dart';
import 'comic_cubit.dart';

@immutable
abstract class ComicListState extends ComicState {
  ComicListState();
  @override
  String toString() => "Comic List State";
}

class ComicListInitial extends ComicState {
  ComicListInitial();
}

class ComicListLoading extends ComicState {
  ComicListLoading();
}

class ComicListLoaded extends ComicState {
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

class ComicListError extends ComicState {
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
