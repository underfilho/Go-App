import 'package:dartz/dartz.dart';
import 'package:go_app/app/core/errors/failure.dart';

typedef AsyncResult<T> = Future<Either<Failure, T>>;
typedef AsyncCall = Future<Option<Failure>>;
