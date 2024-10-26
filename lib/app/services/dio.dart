import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioServiceProvider = Provider<DioService>(
  (ref) => DioService.insatance,
);

class DioService {
  DioService._();

  static final insatance = DioService._();

  final Dio _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 90),
    receiveTimeout: const Duration(seconds: 90),
    sendTimeout: const Duration(seconds: 90),
    responseType: ResponseType.json,
  ));

  Options headers(String? sessionToken) =>
      Options(headers: {"Authorization": '$sessionToken'});

  //get
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        data: payload ?? data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Something went wrong: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }

//post
  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Failed to fetch data: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }

  //put
  Future<Map<String, dynamic>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Failed to fetch data: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }

  //delete
  Future<Map<String, dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? payload,
    CancelToken? cancelToken,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: payload ?? data,
        cancelToken: cancelToken,
      );
      if (response.statusCode == 200 || response.data['success']) {
        return response.data;
      }

      throw Exception("Failed to fetch data: ${response.data.toString()}");
    } catch (error) {
      throw Exception("Failed to fetch data: ${error.toString()}");
    }
  }
}
