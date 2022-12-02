class AppFailure {
  String? message;
  AppFailure({
    this.message,
  });
}

// General failures
class AuthFailure extends AppFailure {
  String code;
  AuthFailure({
    required this.code,
    String? message,
  }) : super(message: message);
}

class ServerFailure extends AppFailure {}

class CacheFailure extends AppFailure {}
