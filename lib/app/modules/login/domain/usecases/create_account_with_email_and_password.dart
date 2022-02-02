import '../../../../core/errors/errors.dart';
import '../repositories/create_account_repository.dart';
import 'package:dartz/dartz.dart';

abstract class CreateAccountWithEmailAndPassword {
  Future<Either<Failure, void>> call(String email, String password);
}

class CreateAccountWithEmailAndPasswordImpl
    implements CreateAccountWithEmailAndPassword {
  final CreateAccountRepository repository;

  CreateAccountWithEmailAndPasswordImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Left(ParamsEmpty(message: 'Email or Password is empty'));
    }
    return await repository.createAccountWithEmailAndPassword(email, password);
  }
}
