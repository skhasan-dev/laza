import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:laza/core/index.dart' show DioExceptionExt;

class APIException implements Exception {
  APIException({required this.message, required this.statusCode});

  final String? message;
  final int? statusCode;

  factory APIException.from(dynamic e) {
    final exception = APIException(
      message: (e is DioException) ? e.getErrorFromResponse() : e.toString(),
      statusCode: (e is DioException) ? e.getStatusCodeFromResponse() : 500,
    );

    if (kDebugMode) {
      log('${exception.message}', name: 'Error!!');
    }
    return exception;
  }
}
