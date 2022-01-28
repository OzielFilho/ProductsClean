import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginWithGoogle {
  Future<Either<Failure, AuthResult>> call();
}

class LoginWithGoogleImpl implements LoginWithGoogle {
  final AuthRepository repository;

  LoginWithGoogleImpl(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call() async {
    return await repository.loginWithGoogle();
  }
}
