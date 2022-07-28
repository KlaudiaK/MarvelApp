part of 'comic_search_bloc.dart';

abstract class ComicSearchEvent extends Equatable {
  const ComicSearchEvent();

  @override
  List<Object?> get props => [];
}
class OnTitleChanged extends ComicSearchEvent {
  final String query;

  const OnTitleChanged(this.query);

  @override
  List<Object?> get props => [query];
}
