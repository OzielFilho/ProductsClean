import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/login_datasource.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements AuthRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, AuthResult>> loginWithFacebook() async {
    try {
      final result = await datasource.loginWithFacebook();
      return Right(result);
    } catch (e) {
      return Left(LoginError(message: 'Login Error'));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> loginWithGoogle() async {
    try {
      final result = await datasource.loginWithGoogle();
      return Right(result);
    } catch (e) {
      return Left(LoginError());
    }
  }

  @override
  Future<Either<Failure, AuthResult>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final result =
          await datasource.loginWithEmailAndPassword(email, password);
      return Right(result);
    } catch (e) {
      return Left(LoginError());
    }
  }
}
