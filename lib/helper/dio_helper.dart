import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "",
        receiveDataWhenStatusError: true,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  static Future<Response> getData({
    required String? url,
    Map<String, dynamic>? query,
  }) async {
    //? for option headers  is = old header+ optional header
    return await dio.get(
      url!,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    //? for option headers  is = old header+ optional header
    // dio.options.headers = {"Authorization": token!, "lang": lang!};
    return await dio.post(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String? url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
  }) async {
    //? for option headers  is = old header+ optional header
    // dio.options.headers = {"Authorization": token!, "lang": lang!};
    return await dio.put(
      url!,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response>? deleteData({
    String? url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    return await dio.delete(
      url!,
      data: data,
      queryParameters: query,
      // options: Options(headers:{} )
    );
  }
}
