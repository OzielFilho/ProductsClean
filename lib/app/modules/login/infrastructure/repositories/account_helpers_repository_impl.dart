import '../../domain/entities/logged_user_info.dart';
import '../../../../core/errors/errors.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/account_helpers_repository.dart';
import '../datasources/account_helpers_datasource.dart';
import 'package:dartz/dartz.dart';

class AccountHelpersRepositoryImpl implements AccountHelpersRepository {
  final AccountHelpersDataSource datasource;

  AccountHelpersRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, void>> recoveryPassword(String email) async {
    try {
      final result = await datasource.recoveryPassword(email);
      return Right(result);
    } catch (e) {
      return Left(RecoveryPasswordError(message: 'Erro recovery Password'));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      final result = await datasource.getUserLogged();
      return Right(result);
    } catch (e) {
      return Left(LoggedUserError(message: 'Erro get user logged'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await datasource.logout();
      return Right(result);
    } catch (e) {
      return Left(LogoutError(message: 'Erro in logout user'));
    }
  }
}
