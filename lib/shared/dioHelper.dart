import 'package:dio/dio.dart';

class Diohelper {
  static late Dio _dio;
  static init() {
    BaseOptions options =
        BaseOptions(baseUrl: "https://student.valuxapps.com/api/");
    _dio = Dio(options);
  }

  static Future<Response> getData(
      {required String path, String lang = "ar", String? Authorization}) async {
    return await _dio.get(path,
        options: Options(headers: {
          "lang": lang,
          "Content-Type": "application/json",
          "Authorization": Authorization
        }));
  }
}
