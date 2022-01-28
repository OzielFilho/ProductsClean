import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';

abstract class LoginDatasource {
  Future<LoginResults> loginWithGoogle();
  Future<LoginResults> loginWithFacebook();
  Future<LoginResults> loginWithEmailAndPassword(String email, String password);
  Future<void> createAccountWithEmailAndPassword(String email, String password);
  Future<void> recoveryPassword(String email);
}
