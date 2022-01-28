class Failure implements Exception {
  String? message;
  Failure({
    this.message,
  });
}

class ResultEmpty implements Failure {
  @override
  String? message;
  ResultEmpty({
    this.message,
  });
}

class LoginError implements Failure {
  @override
  String? message;
  LoginError({
    this.message,
  });
}

class ParamsEmpty implements Failure {
  @override
  String? message;
  ParamsEmpty({
    this.message,
  });
}
