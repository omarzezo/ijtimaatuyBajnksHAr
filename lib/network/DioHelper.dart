import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:itimaaty/network/end_points.dart';

import '../Utils/Constants.dart';

class DioHelperDio {
  static  Dio dio;


  // static init() {
  //   print('dioHelper Initialized');
  //   dio = Dio(
  //       BaseOptions(
  //         baseUrl:Constants.BASE_URL,
  //         receiveDataWhenStatusError: true,
  //       ));
  // }

  // static Future<Response> getData ({String url, String token,}) async {
  //   dio.interceptors.add(DioCacheManager(CacheConfig(baseUrl:Constants.BASE_URL)).interceptor);
  //   dio.options.headers = {
  //     'Content-Type':'application/json',
  //     'token' : '$token'
  //   };
  //   return await dio.get(url,
  //       options: buildCacheOptions(
  //                    Duration(days: 3),
  //                    maxStale: Duration(days: 7),
  //                    forceRefresh: true,
  //       )
  //       // queryParameters: query
  //   );
  // }

  // static Future<Response> postData ({
  //   String url,
  //   Map<String,dynamic> query,
  //   Map<String,dynamic> data,
  //   String lang = 'ar',
  //   String token
  // })async
  // {
  //   dio.options.headers =
  //   {
  //     'lang':'$lang',
  //     'Content-Type':'application/json',
  //     'Authorization' : '$token'
  //   };
  //   return await dio.post(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //
  //   );
  // }

  // static Future<Response> putData ({
  //   String url,
  //   Map<String,dynamic> query,
  //   Map<String,dynamic> data,
  //   String lang = 'ar',
  //   String token
  // })async
  // {
  //   dio.options.headers =
  //   {
  //     'lang':'$lang',
  //     'Content-Type':'application/json',
  //     'Authorization' : '$token'
  //   };
  //   return await dio.put(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }
  //
  // static Future<Response> deleteData ({
  //   String url,
  //   String lang = 'ar',
  //   String token
  // })async
  // {
  //   dio.options.headers =
  //   {
  //     'lang':'$lang',
  //     'Content-Type':'application/json',
  //     'Authorization' : '$token'
  //   };
  //   return await dio.delete(url);
  // }
}