import 'package:agence_teste/app/modules/login/domain/usecases/login_with_facebook.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithGoogle loginGoogle;
  final LoginWithFacebook loginFacebook;
  _LoginControllerBase(this.loginGoogle, this.loginFacebook);

  @action
  loginWithGoogle() async {
    final result = await loginGoogle();
    return result.fold(
        (failure) => failure, (result) => result as LoginResults);
  }

  @action
  loginWithFacebook() async {
    final result = await loginFacebook();
    return result.fold(
        (failure) => failure, (result) => result as LoginResults);
  }
}
