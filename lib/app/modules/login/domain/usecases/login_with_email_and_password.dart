import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginWithEmailAndPassword {
  Future<Either<Failure, AuthResult>> call(String email, String password);
}

class LoginWithEmailAndPasswordImpl implements LoginWithEmailAndPassword {
  final AuthRepository repository;

  LoginWithEmailAndPasswordImpl(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call(
      String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Left(ParamsEmpty());
    }
    return await repository.loginWithEmailAndPassword(email, password);
  }
}
