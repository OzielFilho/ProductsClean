import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';

abstract class LoginDatasource {
  Future<LoginResults> loginWithGoogle();
  Future<LoginResults> loginWithFacebook();
}
