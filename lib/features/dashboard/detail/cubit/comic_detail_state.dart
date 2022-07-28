import 'package:flutter/cupertino.dart';
import '../../../../data/local/comic.dart';

@immutable
abstract class ComicDetailState {}

class ComicDetailInitial extends ComicDetailState {}

class ComicDetailLoading extends ComicDetailState {
  ComicDetailLoading();
}

class ComicDetailLoaded extends ComicDetailState {
  final ComicItem? comic;
  ComicDetailLoaded(this.comic);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComicDetailLoaded && o.comic == comic;
  }

  @override
  int get hashCode => comic.hashCode;
}

class ComicDetailError extends ComicDetailState {
  final String message;
  ComicDetailError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComicDetailError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
