part of 'comic_search_bloc.dart';

abstract class ComicSearchState extends Equatable {
  const ComicSearchState();
  
  @override
  List<Object?> get props => [];
}

class ComicSearchInitial extends ComicSearchState {}
class ComicSearchLoading extends ComicSearchState {}
class ComicSearchLoaded extends ComicSearchState {
  final List<ComicItem?> comicList;
  const ComicSearchLoaded(this.comicList);
  @override
  List<Object?> get props => [comicList];
}
class ComicSearchError extends ComicSearchState {}

