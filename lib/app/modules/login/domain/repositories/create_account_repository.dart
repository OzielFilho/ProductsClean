import '../../../../core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class CreateAccountRepository {
  Future<Either<Failure, void>> createAccountWithEmailAndPassword(
      String email, String password);
}
