import 'package:agence_teste/app/modules/login/infrastructure/models/authentication_result_model.dart';

abstract class AuthDatasource {
  Future<AuthenticationResult> loginWithGoogle();
  Future<AuthenticationResult> loginWithFacebook();
  Future<AuthenticationResult> loginWithEmailAndPassword(
      String email, String password);
  Future<void> createAccountWithEmailAndPassword(String email, String password);
  Future<void> recoveryPassword(String email);
}
