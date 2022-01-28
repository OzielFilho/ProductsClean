import 'package:agence_teste/app/core/errors/errors.dart';

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
