import 'package:equatable/equatable.dart';
import 'package:marvel_app/features/dashboard/cubit/response_status.dart';

import '../../../data/local/comic.dart';
import 'response_status.dart';

class SearchScreenState extends Equatable {
  final ResponseStatus searchedComicsListStatus;
  final List<ComicItem?> searchedComicsList;

  const SearchScreenState(
      {this.searchedComicsListStatus = ResponseStatus.initial,
      this.searchedComicsList = const []});
  @override
  List<Object?> get props => [searchedComicsListStatus, searchedComicsList];

  SearchScreenState copyWith({
    ResponseStatus? searchedComicsListStatus,
    List<ComicItem?>? searchedComicsList,
  }) {
    return SearchScreenState(
        searchedComicsListStatus:
            searchedComicsListStatus ?? this.searchedComicsListStatus,
        searchedComicsList: searchedComicsList ?? this.searchedComicsList);
  }
}
