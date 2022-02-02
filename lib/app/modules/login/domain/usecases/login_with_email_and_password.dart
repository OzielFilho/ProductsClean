import '../entities/auth_result.dart';
import '../../../../core/errors/errors.dart';
import '../repositories/auth_repository.dart';
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
      return Left(ParamsEmpty(message: 'Email or Password is empty'));
    }
    return await repository.loginWithEmailAndPassword(email, password);
  }
}
