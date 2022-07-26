part of 'search_comic_list_cubit.dart';

@immutable
abstract class SearchComicListState extends ComicState{
   SearchComicListState();
}

class SearchComicListInitial extends SearchComicListState {
   SearchComicListInitial();
}

class SearchComicListLoading extends SearchComicListState {
   SearchComicListLoading();
}

class SearchComicListLoaded extends SearchComicListState {
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

class SearchComicListError extends SearchComicListState {
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
