import '../../../../core/errors/errors.dart';

class LoginError implements Failure {
  @override
  String? message;
  LoginError({
    this.message,
  });
}

class CreateAccountError implements Failure {
  @override
  String? message;
  CreateAccountError({
    this.message,
  });
}

class RecoveryPasswordError implements Failure {
  @override
  String? message;
  RecoveryPasswordError({
    this.message,
  });
}

class LoggedUserError implements Failure {
  @override
  String? message;
  LoggedUserError({
    this.message,
  });
}

class LogoutError implements Failure {
  @override
  String? message;
  LogoutError({
    this.message,
  });
}
