import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
//https://newsapi.org/v2/top-headlines/sources?apiKey=85de9ad38c00463ab7471fcfc793627d
  // Initialize Dio
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/v2/', // Replace with your API base URL
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // GET request
  static Future<Response> getData({required String url,
  }) async {
    return await dio!.get(url);
  }



}
