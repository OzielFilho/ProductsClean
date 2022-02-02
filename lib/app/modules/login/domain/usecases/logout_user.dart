import '../../../../core/errors/errors.dart';
import '../repositories/account_helpers_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LogoutUser {
  Future<Either<Failure, void>> call();
}

class LogoutUserImpl implements LogoutUser {
  final AccountHelpersRepository repository;

  LogoutUserImpl(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}
