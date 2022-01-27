import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/login_datasource.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements AuthRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, AuthResult>> auth() async {
    try {
      final result = await datasource.login();
      return Right(result);
    } catch (e) {
      return Left(LoginError());
    }
  }
}
