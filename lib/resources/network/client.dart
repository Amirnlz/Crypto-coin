import 'package:dio/dio.dart';

class Client {
  Dio init() {
    Dio _dio = Dio();
    _dio.options.baseUrl = 'https://api.coingecko.com/api/v3';
    return _dio;
  }

  Future<Response> get(String url) async {
    Dio _dio = init();
    return await _dio.get(url);
  }
}
