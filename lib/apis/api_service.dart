import 'package:dio/dio.dart';
import 'api_config.dart';

class APIService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIConfig.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Map<String, dynamic>> post({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    var response = await _dio.post(
      endpoint,
      data: body,
      queryParameters: params ?? {},
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    _dio.options.headers = {'Authorization': 'Bearer $token'};
    var response = await _dio.get(
      endpoint,
      queryParameters: params ?? {},
    );
    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else {
      return {'data': response};
    }
  }

  static Future<Map<String, dynamic>> delete({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
    String? contentType = Headers.formUrlEncodedContentType,
  }) async {
    _dio.options.headers = {
      'Content-Type': contentType,
      'Authorization': 'Bearer $token'
    };
    var response = await _dio.delete(
      endpoint,
      data: FormData.fromMap(body ?? {}),
      queryParameters: params ?? {},
    );
    return response.data;
  }
  static Future<Map<String, dynamic>> put({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
    String? contentType = Headers.formUrlEncodedContentType,
  }) async {
    _dio.options.headers = {
      'Content-Type': contentType,
      'Authorization': 'Bearer $token'
    };
    var response = await _dio.put(
      endpoint,
      data: FormData.fromMap(body ?? {}),
      queryParameters: params ?? {},
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> patch({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
    String? contentType = Headers.formUrlEncodedContentType,
  }) async {
    _dio.options.headers = {
      'Content-Type': contentType,
      'Authorization': 'Bearer $token'
    };
    var response = await _dio.patch(
      endpoint,
      data: FormData.fromMap(body ?? {}),
      queryParameters: params ?? {},
    );
    return response.data;
  }
}