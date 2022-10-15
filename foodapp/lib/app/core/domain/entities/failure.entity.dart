abstract class Failure {
  String? message;
  Failure({
    this.message,
  });
}

// General failures
class AuthFailure extends Failure {
  String code;
  AuthFailure({
    required this.code,
    String? message,
  }) : super(message: message);
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
