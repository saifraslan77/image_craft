import 'package:dio/dio.dart';
import 'api_config.dart';
import 'package:http_parser/http_parser.dart';

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
    try {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': token,
      };
      var response = await _dio.post(
        endpoint,
        data: body,
        queryParameters: params ?? {},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to POST data');
    }
  }

  static Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, dynamic>? params,
    String? token,
  }) async {
    _dio.options.headers = {
      if (token != null) 'Authorization': 'Bearer $token',
    };
    var response = await _dio.get(
      endpoint,
      queryParameters: params ?? {},
    );
    if (response.data is Map<String, dynamic>) {
      return response.data;
    } else {
      return {'data': response.data};
    }
  }

  static Future<Map<String, dynamic>> delete({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
    String? contentType = Headers.formUrlEncodedContentType,
  }) async {
    try {
      _dio.options.headers = {
        'Content-Type': contentType,
        'Authorization': token,
      };
      var response = await _dio.delete(
        endpoint,
        data: FormData.fromMap(body ?? {}),
        queryParameters: params ?? {},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to DELETE data');
    }
  }

  static Future<Map<String, dynamic>> put({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
    String? contentType = Headers.formUrlEncodedContentType,
  }) async {
    try {
      _dio.options.headers = {
        'Content-Type': contentType,
        'Authorization': token,
      };
      var response = await _dio.put(
        endpoint,
        data: FormData.fromMap(body ?? {}),
        queryParameters: params ?? {},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to PUT data');
    }
  }

  static Future<Map<String, dynamic>> patch({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    String? token,
    String? contentType = Headers.formUrlEncodedContentType,
  }) async {
    try {
      _dio.options.headers = {
        'Content-Type': contentType,
        'Authorization': token,
      };
      var response = await _dio.patch(
        endpoint,
        data: FormData.fromMap(body ?? {}),
        queryParameters: params ?? {},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to PATCH data');
    }
  }

  static Future<Map<String, dynamic>> sendFormData({
    required String endpoint,
    required FormData formData,
    Map<String, dynamic>? params,
    required String token,
  }) async {
    try {
      var response = await _dio.post(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': Headers.multipartFormDataContentType,
            'Authorization': 'Bearer $token',
          },
        ),
        queryParameters: params ?? {},
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to send form data');
    }
  }
}

class AiApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIConfig.aiBaseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      receiveDataWhenStatusError: true,
    ),
  );

  static Future<Map<String, dynamic>> sendFormData({
    required String imagePath,
    required String token,
  }) async {
    FormData formData = FormData.fromMap({});
    formData.files.add(
      MapEntry(
        'image',
        await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
          contentType: MediaType('image', 'PNG'),
        ),
      ),
    );
    var response = await _dio.post(
      APIConfig.aiEndPoint,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': Headers.multipartFormDataContentType,
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }
}
