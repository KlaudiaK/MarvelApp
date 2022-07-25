import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comic_detail_state.dart';

class ComicDetailCubit extends Cubit<ComicDetailState> {
  ComicDetailCubit() : super(ComicDetailInitial());
}
