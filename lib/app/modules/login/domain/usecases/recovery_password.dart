import '../../../../core/errors/errors.dart';
import '../repositories/account_helpers_repository.dart';
import 'package:dartz/dartz.dart';

abstract class RecoveryPassword {
  Future<Either<Failure, void>> call(String email);
}

class RecoveryPasswordImpl implements RecoveryPassword {
  final AccountHelpersRepository repository;

  RecoveryPasswordImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    if (email.isEmpty) {
      return Left(ParamsEmpty(message: 'Email is empty'));
    }
    return await repository.recoveryPassword(email);
  }
}
