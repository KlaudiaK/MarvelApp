import 'package:marvel_app/data/local/comic.dart';

abstract class ComicRepositoryInterface{
  Future<List<ComicItem?>> getComicList();
  Future<List<ComicItem?>> searchComicList({required String query});
  Future<ComicItem?> getComicInfo({required String id});
}