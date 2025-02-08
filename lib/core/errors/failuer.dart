abstract class Failures {
  String errMsg;

  Failures({required this.errMsg});
}

class ServerError extends Failures {
  ServerError({required super.errMsg});
}

class NetworkError extends Failures {
  NetworkError({required super.errMsg});
}
