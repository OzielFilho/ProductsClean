import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LogoutUser {
  Future<Either<Failure, void>> call();
}

class LogoutUserImpl implements LogoutUser {
  final AuthRepository repository;

  LogoutUserImpl(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}