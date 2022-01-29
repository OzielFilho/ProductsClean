import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class RecoveryPassword {
  Future<Either<Failure, void>> call(String email);
}

class RecoveryPasswordImpl implements RecoveryPassword {
  final AuthRepository repository;

  RecoveryPasswordImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    if (email.isEmpty) {
      return Left(ParamsEmpty(message: 'Email is empty'));
    }
    return await repository.recoveryPassword(email);
  }
}
