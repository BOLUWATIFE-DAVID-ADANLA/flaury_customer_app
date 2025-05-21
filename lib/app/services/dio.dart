import 'package:dio/dio.dart';
import 'package:flaury_mobile/app/util/api_routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/web.dart';

final dioServiceProvider = Provider<DioService>(
  (ref) => DioService.instance,
);

class DioService {
  DioService._();

  static final instance = DioService._();
  final logger = Logger();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiRoutes.baseUrl,
    connectTimeout: const Duration(seconds: 90),
    receiveTimeout: const Duration(seconds: 90),
    sendTimeout: const Duration(seconds: 90),
    responseType: ResponseType.json,
    headers: {"Content-Type": "application/json; charset=UTF-8"},
  ));

  static Options headers(String? sessionToken) =>
      Options(headers: {"Authorization": '$sessionToken'});

  void _logRequest(String method, String path,
      {Object? data, Map<String, dynamic>? query, Options? options}) {
    logger.i("📤 [$method] Request to: $path");
    if (query != null) logger.i("🔎 Query: $query");
    if (data != null) logger.i("📦 Data: $data");
    if (options?.headers != null) logger.i("🧾 Headers: ${options!.headers}");
  }

  void _logResponse(Response response) {
    logger.i(
        "✅ Response [${response.statusCode}] from ${response.requestOptions.path}");
    logger.i("📨 Response data: ${response.data}");
  }

  Future<Map<String, dynamic>> _handleResponse(Response response) async {
    final statusCode = response.statusCode;
    final data = response.data;

    if (statusCode == null) {
      throw CustomException('No status code in response');
    }

    if (statusCode >= 200 && statusCode < 300) {
      if (data is Map<String, dynamic> || data is List<dynamic>) {
        return data;
      }
      throw CustomException('Invalid response format');
    }

    switch (statusCode) {
      case 400:
        throw CustomException('Bad Request');
      case 401:
        throw CustomException('Invalid or expired token');
      case 403:
        throw CustomException('Forbidden');
      case 404:
        throw CustomException('Resource not found');
      case 429:
        throw CustomException('Too many requests. Please try again later.');
      case 500:
        throw CustomException('Internal Server Error');
      default:
        final errorMessage = data is Map<String, dynamic>
            ? data['message']?.toString()
            : 'Request failed with status $statusCode';
        throw CustomException(errorMessage ?? 'Unknown error occurred');
    }
  }

  // GET
  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      Options? options,
      String? sessionToken}) async {
    try {
      final opts = options ?? headers(sessionToken);
      _logRequest('GET', path,
          data: data, query: queryParameters, options: opts);

      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        data: data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: opts,
      );

      _logResponse(response);
      return await _handleResponse(response);
    } on DioException catch (e) {
      logger.e("❌ Dio GET error: ${e.message}");
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      logger.e("❗ Unexpected GET error: $e");
      throw CustomException('An unexpected error occurred');
    }
  }

  // POST
  Future<Map<String, dynamic>> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      Options? options,
      String? sessionToken}) async {
    try {
      final opts = options ?? headers(sessionToken);
      _logRequest('POST', path,
          data: data, query: queryParameters, options: opts);

      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
        options: opts,
      );

      _logResponse(response);
      return await _handleResponse(response);
    } on DioException catch (e) {
      logger.e("❌ Dio POST error: ${e.message}");
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      logger.e("❗ Unexpected POST error: $e");
      throw CustomException('An unexpected error occurred');
    }
  }

  // PUT
  Future<Map<String, dynamic>> put(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Map<String, dynamic>? payload,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      String? sessionToken,
      Options? option}) async {
    try {
      final opts = option ?? headers(sessionToken);
      final requestData = payload ?? data;
      _logRequest('PUT', path,
          data: requestData, query: queryParameters, options: opts);

      final response = await _dio.put(
        path,
        data: requestData,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: opts,
      );

      _logResponse(response);
      return await _handleResponse(response);
    } on DioException catch (e) {
      logger.e("❌ Dio PUT error: ${e.message}");
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      logger.e("❗ Unexpected PUT error: $e");
      throw CustomException('An unexpected error occurred');
    }
  }

  // DELETE
  Future<Map<String, dynamic>> delete(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Map<String, dynamic>? payload,
      CancelToken? cancelToken,
      String? sessionToken,
      Options? option}) async {
    try {
      final opts = option ?? headers(sessionToken);
      final requestData = payload ?? data;
      _logRequest('DELETE', path,
          data: requestData, query: queryParameters, options: opts);

      final response = await _dio.delete(
        path,
        data: requestData,
        cancelToken: cancelToken,
        options: opts,
      );

      _logResponse(response);
      return await _handleResponse(response);
    } on DioException catch (e) {
      logger.e("❌ Dio DELETE error: ${e.message}");
      throw CustomException(e.message ?? 'Network error occurred');
    } catch (e) {
      logger.e("❗ Unexpected DELETE error: $e");
      throw CustomException('An unexpected error occurred');
    }
  }
}

class CustomException implements Exception {
  final String message;

  CustomException(this.message);

  @override
  String toString() => "CustomException: $message";
}
