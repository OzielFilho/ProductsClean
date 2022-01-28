import 'package:agence_teste/app/modules/login/domain/usecases/create_account_with_email_and_password.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_email_and_password.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_facebook.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithGoogle loginGoogle;
  final LoginWithFacebook loginFacebook;
  final LoginWithEmailAndPassword loginWithEmail;
  final CreateAccountWithEmailAndPassword createAccountWithEmail;
  _LoginControllerBase(this.loginGoogle, this.loginFacebook,
      this.loginWithEmail, this.createAccountWithEmail);

  @action
  loginWithGoogle() async {
    final result = await loginGoogle();
    return result.fold(
        (failure) => failure, (result) => result as LoginResults);
  }

  @action
  loginWithFacebook() async {
    final result = await loginFacebook();
    return result.fold((failure) => failure, (result) => result);
  }

  @action
  loginWithEmailAndPassword(String email, String password) async {
    final result = await loginWithEmail(email, password);
    return result.fold((failure) => failure, (result) => result);
  }

  @action
  createAccountWithEmailAndPassword(String email, String password) async {
    final result = await createAccountWithEmail(email, password);
    return result.fold((failure) => failure, (result) => result);
  }
}
