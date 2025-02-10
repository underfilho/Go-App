abstract interface class Failure {}

class NotFoundFailure implements Failure {}

class ConnectionFailure implements Failure {}

class TimeoutFailure implements Failure {}

class HttpFailure implements Failure {
  final int code;

  HttpFailure(this.code);
}
