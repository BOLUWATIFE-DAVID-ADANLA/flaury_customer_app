import 'package:dio/dio.dart';
import 'package:flaury_mobile/app/util/api_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';

final dioServiceProvider = Provider<DioService>(
  (ref) => DioService.instance,
);

class DioService {
  DioService._();

  static final instance = DioService._();

  final log = Logger();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiRoutes.baseUrl,
    connectTimeout: const Duration(seconds: 90),
    receiveTimeout: const Duration(seconds: 90),
    sendTimeout: const Duration(seconds: 90),
    responseType: ResponseType.json,
    headers: {"Content-Type": "application/json; charset=UTF-8"},
  ));

  static Options headers(String? sessionToken) =>
      Options(headers: {"Authorization": 'Bearer $sessionToken'});

  Future<Map<String, dynamic>> _handleResponse(Response response) async {
    final statusCode = response.statusCode;
    final data = response.data;

    log.d("✅ Response from ${response.requestOptions.uri}: $data");

    if (statusCode == null) {
      throw CustomException('No status code in response');
    }

    if (statusCode >= 200 && statusCode < 300) {
      return data;
    }

    switch (statusCode) {
      case 429:
        throw CustomException('Too many requests. Please try again later.');
      case 500:
        throw CustomException('Internal Server Error');
      default:
        throw CustomException('Unknown error occurred');
    }
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    Options? options,
    String? sessionToken,
  }) async {
    try {
      final opts = options ?? headers(sessionToken);
      log.d("📤 GET Request: $path\nQuery: $queryParameters");
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: opts,
      );
      return await _handleResponse(response);
    } on DioException catch (e) {
      _logAndThrowDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    Options? options,
    String? sessionToken,
  }) async {
    try {
      final opts = options ?? headers(sessionToken);
      log.d("📤 POST Request: $path\nBody: $data");
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: opts,
      );
      return await _handleResponse(response);
    } on DioException catch (e) {
      _logAndThrowDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    String? sessionToken,
    Options? option,
  }) async {
    try {
      final opts = option ?? headers(sessionToken);
      final requestData = payload ?? data;
      log.d("📤 PUT Request: $path\nBody: $requestData");
      final response = await _dio.put(
        path,
        data: requestData,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: opts,
      );
      return await _handleResponse(response);
    } on DioException catch (e) {
      _logAndThrowDioError(e);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    String? sessionToken,
    Options? option,
  }) async {
    try {
      final opts = option ?? headers(sessionToken);
      final requestData = payload ?? data;
      log.d("📤 DELETE Request: $path\nBody: $requestData");
      final response = await _dio.delete(
        path,
        data: requestData,
        cancelToken: cancelToken,
        options: opts,
      );
      return await _handleResponse(response);
    } on DioException catch (e) {
      _logAndThrowDioError(e);
      rethrow;
    }
  }

  _logAndThrowDioError(DioException e) {
    log.e("❌ Dio Error [${e.type}] - ${e.message}");
    if (e.response != null) {
      log.e("❌ Error Response Data: ${e.response?.data}");
      final data = e.response?.data;

      if (data.containsKey('error details')) {
        throw CustomException(data['error details'].toString());
      }

      if (data.containsKey('response description')) {
        throw CustomException(data['response description'].toString());
      }
      if (data is Map<String, dynamic> && data.containsKey('message')) {
        throw CustomException(data['message']);
      } else if (data is String) {
        throw CustomException(data);
      }
    }
    throw CustomException(e.message ?? 'An unexpected error occurred');
  }
}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => " $message";
}
