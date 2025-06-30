import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com';
  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> get(String endpoint) async {
    final response = await dio.get('$baseUrl/$endpoint');
    return response.data;
  }

  Future<dynamic> post(String endpoint, dynamic data) async {
    final response = await dio.post('$baseUrl/$endpoint', data: data);
    return response.data;
  }

  Future<dynamic> put(String endpoint, dynamic data) async {
    final response = await dio.put('$baseUrl/$endpoint', data: data);
    return response.data;
  }

  Future<dynamic> delete(String endpoint) async {
    final response = await dio.delete('$baseUrl/$endpoint');
    return response.data;
  }
}
