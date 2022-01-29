import 'package:agence_teste/app/modules/login/domain/usecases/create_account_with_email_and_password.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_email_and_password.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_facebook.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/recovery_password.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/authentication_result_model.dart';
import 'package:flutter/cupertino.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithGoogle loginGoogle;
  final LoginWithFacebook loginFacebook;
  final LoginWithEmailAndPassword loginWithEmail;
  final CreateAccountWithEmailAndPassword createAccountWithEmail;
  final RecoveryPassword recoveryPasswordI;
  _LoginControllerBase(this.loginGoogle, this.loginFacebook,
      this.loginWithEmail, this.createAccountWithEmail, this.recoveryPasswordI);

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  loginWithGoogle() async {
    final result = await loginGoogle();
    return result.fold(
        (failure) => failure, (result) => result as AuthenticationResult);
  }

  @action
  loginWithFacebook() async {
    final result = await loginFacebook();
    return result.fold(
        (failure) => failure, (result) => result as AuthenticationResult);
  }

  @action
  loginWithEmailAndPassword(String email, String password) async {
    final result = await loginWithEmail(email, password);
    return result.fold(
        (failure) => failure, (result) => result as AuthenticationResult);
  }

  @action
  createAccountWithEmailAndPassword(String email, String password) async {
    final result = await createAccountWithEmail(email, password);
    return result.fold((failure) => failure, (result) => result);
  }

  @action
  recoveryPassword(String email) async {
    final result = await recoveryPasswordI(email);
    return result.fold((failure) => failure, (result) => result);
  }
}
