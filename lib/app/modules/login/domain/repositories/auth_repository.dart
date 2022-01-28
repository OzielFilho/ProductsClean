import 'package:agence_teste/app/modules/login/domain/entities/auth_result.dart';
import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> loginWithGoogle();
  Future<Either<Failure, AuthResult>> loginWithFacebook();
  Future<Either<Failure, AuthResult>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, void>> createAccountWithEmailAndPassword(
      String email, String password);
}
