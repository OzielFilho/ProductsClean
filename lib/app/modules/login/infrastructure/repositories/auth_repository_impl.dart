import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:agence_teste/app/modules/login/domain/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, AuthResult>> loginWithFacebook() async {
    try {
      final result = await datasource.loginWithFacebook();
      return Right(result);
    } catch (e) {
      return Left(LoginError(message: 'Erro Login Facebook'));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> loginWithGoogle() async {
    try {
      final result = await datasource.loginWithGoogle();

      return Right(result);
    } catch (e) {
      return Left(LoginError(message: 'Erro Login Google'));
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
      return Left(LoginError(message: 'Erro Login Email and Password'));
    }
  }

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
    try{
      final result = await datasource.getUserLogged();
      return Right(result);
    }catch(e){
      return Left(RecoveryPasswordError(message: 'Erro recovery Password'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
