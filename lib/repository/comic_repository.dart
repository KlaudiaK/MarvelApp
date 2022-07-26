import 'dart:developer';
import 'package:marvel_app/data/local/comic.dart';
import 'package:marvel_app/data/remote/comic_dto.dart';
import 'package:marvel_app/network/api_client.dart';
import 'package:marvel_app/repository/comic_repository_interface.dart';
import 'package:dio/dio.dart';
import '../data/remote/results_dto.dart';

class ComicRepository implements ComicRepositoryInterface {
  ComicRepository({required this.api});
  DioClient api;

  @override
  Future<ComicItem?> getComicInfo({required String id}) async {
    Results? comic;
    try {
      Response userData = await api.dio.get(api.getPath, queryParameters: {
        "ts": api.getTimestamp,
        "apikey": api.getApiKey,
        "hash": api.getHash,
        "id": id
      });
      log('Comic Info: ${userData.data}');
      comic = ComicDTO.fromJson(userData.data).data?.results?.first;
    } on DioError catch (e) {
      handleDioError(e);
    }
    ComicItem? item = comic?.toComicItem();
    return item;
  }

  @override
  Future<List<ComicItem>> getComicList() async {
    List<Results>? comicList;
    List<ComicItem> resultsList = <ComicItem>[];

    try {
      Response userData = await api.dio.get(api.getPath, queryParameters: {
        "ts": api.getTimestamp,
        "apikey": api.getApiKey,
        "hash": api.getHash,
        "limit": api.getLimit,
        "offset": api.getOffset,
        "orderBy": api.getOrderBy
      });
      log('Comic Info: ${userData.data}');
      comicList = ComicDTO.fromJson(userData.data).data?.results;
    } on DioError catch (e) {
      handleDioError(e);
    }
    comicList?.forEach((element) {
      resultsList.add(element.toComicItem());
    });

    return resultsList;
  }

  @override
  Future<List<ComicItem?>> searchComicList({required String query}) async {
    List<Results>? comicList;
    List<ComicItem> resultsList = <ComicItem>[];
    try {
      Response userData = await api.dio.get(api.getPath, queryParameters: {
        "ts": api.getTimestamp,
        "apikey": api.getApiKey,
        "hash": api.getHash,
        "title": query
      });
      log('Comic Info: ${userData.data}');
      comicList = ComicDTO.fromJson(userData.data).data?.results;
    } on DioError catch (e) {
      handleDioError(e);
    }
    comicList?.forEach((element) {
      resultsList.add(element.toComicItem());
    });
    return resultsList;
  }

  void handleDioError(DioError e) {
    if (e.response != null) {
      log('Dio error!');
      log('STATUS: ${e.response?.statusCode}');
      log('DATA: ${e.response?.data}');
      log('HEADERS: ${e.response?.headers}');
      throw Exception(
          'Failed to get comic from API. Caused by error ${e.response?.statusCode}');
    } else {
      log('Error sending request!');
      log(e.message);
      throw Exception('Cannot send request. ${e.message}');
    }
  }
}
