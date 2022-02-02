import '../models/authentication_result_model.dart';

abstract class AuthDatasource {
  Future<AuthenticationResult> loginWithGoogle();
  Future<AuthenticationResult> loginWithFacebook();
  Future<AuthenticationResult> loginWithEmailAndPassword(
      String email, String password);
}
