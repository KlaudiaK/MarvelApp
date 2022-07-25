import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comic_list_state.dart';

class ComicListCubit extends Cubit<ComicListState> {
  ComicListCubit() : super(ComicListInitial());
}
