import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginWithFacebook {
  Future<Either<Failure, AuthResult>> call();
}

class LoginWithFacebookImpl implements LoginWithFacebook {
  final AuthRepository repository;

  LoginWithFacebookImpl(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call() async {
    return await repository.loginWithFacebook();
  }
}
