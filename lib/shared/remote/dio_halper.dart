import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    try {
      final response = await dio!.get(url, queryParameters: query);
      return response;
    } catch (e) {
      throw Exception('Error occurred while performing GET request: $e');
    }
  }
}