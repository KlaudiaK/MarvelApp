part of 'comic_list_cubit.dart';


@immutable
abstract class ComicListState {
  const ComicListState();
}

class ComicListInitial extends ComicListState {
  const ComicListInitial();
}

class ComicListLoading extends ComicListState {
  const ComicListLoading();
}

class ComicListLoaded extends ComicListState {
  final List<ComicItem> comic;
  const ComicListLoaded(this.comic);

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
  const ComicListError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ComicListError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;

}
