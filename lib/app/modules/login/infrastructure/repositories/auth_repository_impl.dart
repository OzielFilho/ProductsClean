import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

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
}
