import '../../../../core/errors/errors.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/create_account_repository.dart';
import '../datasources/create_account_datasource.dart';
import 'package:dartz/dartz.dart';

class CreateAccountRepositoryImpl implements CreateAccountRepository {
  final CreateAccountDatasource datasource;

  CreateAccountRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, void>> createAccountWithEmailAndPassword(
      String email, String password) async {
    try {
      final result =
          await datasource.createAccountWithEmailAndPassword(email, password);
      return Right(result);
    } catch (e) {
      return Left(CreateAccountError(
          message: 'Erro in Create Account with Email and Password'));
    }
  }
}
