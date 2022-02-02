import '../entities/auth_result.dart';
import '../../../../core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> loginWithGoogle();
  Future<Either<Failure, AuthResult>> loginWithFacebook();
  Future<Either<Failure, AuthResult>> loginWithEmailAndPassword(
      String email, String password);
}
