import '../entities/auth_result.dart';
import '../../../../core/errors/errors.dart';
import '../repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginWithGoogle {
  Future<Either<Failure, AuthResult>> call();
}

class LoginWithGoogleImpl implements LoginWithGoogle {
  final AuthRepository repository;

  LoginWithGoogleImpl(this.repository);

  @override
  Future<Either<Failure, AuthResult>> call() async {
    return await repository.loginWithGoogle();
  }
}
