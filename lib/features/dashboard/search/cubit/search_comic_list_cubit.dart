import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_comic_list_state.dart';

class SearchComicListCubit extends Cubit<SearchComicListState> {
  SearchComicListCubit() : super(SearchComicListInitial());
}
