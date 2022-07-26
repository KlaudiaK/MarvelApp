import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final  _dio = Dio(
    BaseOptions(
      baseUrl: 'https://gateway.marvel.com',
      connectTimeout: 5000,
      receiveTimeout: 10000),
      
  );
  Dio get dio => _dio;
  
  final _baseUrl = 'https://gateway.marvel.com';
  final _path = '/v1/public/comics';
  final _timestamp = '1';
  final _limit = '25';
  final _offset = '0';
  final _order_by = '-onsaleDate';
  final _apiKey = '080a502746c8a60aeab043387a56eef0';
  final _hash = '6edc18ab1a954d230c1f03c590d469d2';

  String get getPath{
    return _path;
  }
  String get getTimestamp{
    return _timestamp;
  }
   String get getLimit{
    return _limit;
  }
   String get getOffset{
    return _offset;
  }
   String get getOrderBy{
    return _order_by;
  }
   String get getHash{
    return _hash;
  }
   String get getApiKey{
    return _apiKey;
  }
}
