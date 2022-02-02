import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../entities/logged_user_info.dart';

abstract class AccountHelpersRepository {
  Future<Either<Failure, void>> recoveryPassword(String email);

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, void>> logout();
}
