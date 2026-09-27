import 'package:laza/core/index.dart' show APIException;

abstract class Failure {
  Failure({required this.message, this.statusCode});

  final String? message;
  final int? statusCode;
}

class APIFailure extends Failure {
  APIFailure({required super.message, required super.statusCode});

  factory APIFailure.fromException({required APIException exception}) =>
      APIFailure(message: exception.message, statusCode: exception.statusCode);

  factory APIFailure.standardError() =>
      APIFailure(message: 'Some Error Occurred!', statusCode: 500);
}

class AppFailure extends Failure {
  AppFailure({required super.message, super.statusCode});
  factory AppFailure.standardError({String? errorMessage}) => AppFailure(
    message: errorMessage ?? 'Some Error Occurred!',
    statusCode: 500,
  );
}
