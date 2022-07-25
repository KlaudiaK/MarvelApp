part of 'comic_detail_cubit.dart';

@immutable
abstract class ComicDetailState {
  const ComicDetailState();
}

class ComicDetailInitial extends ComicDetailState {
  const ComicDetailInitial();
}



class ComicDetailLoading extends ComicDetailState {
  const ComicDetailLoading();
}

class ComicDetailLoaded extends ComicDetailState {
  final ComicItem? comic;
  const ComicDetailLoaded(this.comic);

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
  const ComicDetailError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComicDetailError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;

}
