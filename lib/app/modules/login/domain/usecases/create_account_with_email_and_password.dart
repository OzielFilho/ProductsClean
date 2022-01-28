import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateAccountWithEmailAndPassword {
  Future<Either<Failure, void>> call(String email, String password);
}

class CreateAccountWithEmailAndPasswordImpl
    implements CreateAccountWithEmailAndPassword {
  final AuthRepository repository;

  CreateAccountWithEmailAndPasswordImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Left(ParamsEmpty());
    }
    return await repository.createAccountWithEmailAndPassword(email, password);
  }
}
