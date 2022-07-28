import 'package:equatable/equatable.dart';
import '../../../../data/local/comic.dart';
import '../../response_status.dart';

class ComicListState extends Equatable {
  final ResponseStatus comicListStatus;
  final List<ComicItem> comicList;

  const ComicListState({
    this.comicListStatus = ResponseStatus.initial,
    this.comicList = const [],
  });
  @override
  List<Object?> get props => [comicListStatus, comicList];

  ComicListState copyWith({
    ResponseStatus? comicListStatus,
    List<ComicItem>? comicList,
  }) {
    return ComicListState(
      comicListStatus: comicListStatus ?? this.comicListStatus,
      comicList: comicList ?? this.comicList,
    );
  }
}
