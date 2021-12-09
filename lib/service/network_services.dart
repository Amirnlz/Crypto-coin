import 'package:dio/dio.dart';

class NetworkServices {
  Future<Response> getResponse(String url) async {
    try {
      Response response = await Dio().get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
