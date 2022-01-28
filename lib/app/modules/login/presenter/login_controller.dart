import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithGoogle loginGoogle;

  _LoginControllerBase(this.loginGoogle);

  @action
  loginWithGoogle() async {
    var result = await loginGoogle();
    return result.fold((failure) => failure, (result) => result as LoginResult);
  }
}
