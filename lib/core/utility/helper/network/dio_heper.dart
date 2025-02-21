import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://route-movie-apis.vercel.app/';
  final _moviesBaseUrl = 'https://yts.mx/api/v2/';
  final Dio dio;

  ApiService({required this.dio});
  Future<Map<String, dynamic>> get(
      {required String endPoint,
      required String token
      }) async {
    var response = await dio.get('$_moviesBaseUrl$endPoint',options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': token ?? '',
        }));
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required String token,
    required dynamic data,
  }) async {
    var response = await dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      ),
    );
    return response.data;
  }
}
