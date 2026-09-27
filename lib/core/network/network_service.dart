import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:laza/core/index.dart' show Request;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkService {
  late Dio _dio;

  NetworkService() {
    final extraInterceptors = <Interceptor>[];

    if (kDebugMode) {
      extraInterceptors.add(
        PrettyDioLogger(responseBody: true, requestBody: true),
      );
    }

    _dio = Dio(_getOptions())..interceptors.addAll(extraInterceptors);
  }

  BaseOptions _getOptions() => BaseOptions(
    preserveHeaderCase: true,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
  );

  Future<Response<dynamic>> request(
    Request request, {
    String? tag,
    bool forceNew = false,
  }) async {
    final uri = request.path.startsWith('http')
        ? Uri.parse(request.path)
        : Uri.https('dummyjson', request.path, request.queryParams);

    final method = request.method.name;

    return _dio.requestUri(
      uri,
      data: request.body,
      options: Options(method: method),
    );
  }
}
