import 'package:dartz/dartz.dart';
import 'package:laza/core/index.dart' show APIException;

typedef ResultFuture<T> = Future<Either<APIException, T>>;
typedef ResultVoid = ResultFuture<void>;
