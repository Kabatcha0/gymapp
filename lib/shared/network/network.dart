import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://exerciseapi3.p.rapidapi.com/",
        headers: {
          'content-type': 'application/octet-stream',
          'X-RapidAPI-Key':
              '23c2d84dffmshec49318cfd90f63p1f2d45jsn5ed0e7993a61',
          'X-RapidAPI-Host': 'exerciseapi3.p.rapidapi.com'
        },
        receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String path, String? key, String? params}) async {
    return await dio.get(path,
        queryParameters: key != null ? {key: params} : null);
  }
}
