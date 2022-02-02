import '../../../../core/errors/errors.dart';
import '../entities/logged_user_info.dart';
import '../repositories/account_helpers_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final AccountHelpersRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}
