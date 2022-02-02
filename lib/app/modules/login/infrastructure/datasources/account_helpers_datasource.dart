import '../models/user_result_logged.dart';

abstract class AccountHelpersDataSource {
  Future<void> recoveryPassword(String email);
  Future<UserResultLogged> getUserLogged();
  Future<void> logout();
}
