import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:agence_teste/app/modules/login/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final AuthRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}
