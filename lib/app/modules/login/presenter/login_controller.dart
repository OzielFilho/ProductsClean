import 'package:agence_teste/app/core/presenter/widgets/loading/showLoading.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_email_and_password.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_facebook.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/recovery_password.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/authentication_result_model.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoadingDialog loading;
  final LoginWithGoogle loginGoogle;
  final LoginWithFacebook loginFacebook;
  final LoginWithEmailAndPassword loginWithEmail;

  _LoginControllerBase(
      this.loginGoogle, this.loginFacebook, this.loginWithEmail, this.loading);

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  loginWithGoogle() async {
    final result = await loginGoogle();
    return result.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) => result as AuthenticationResult);
  }

  @action
  loginWithFacebook() async {
    final result = await loginFacebook();
    return result.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) => result as AuthenticationResult);
  }

  @action
  loginWithEmailAndPassword(String email, String password) async {
    loading.show();
    await Future.delayed(const Duration(seconds: 1));
    final result = await loginWithEmail(email, password);
    await loading.hide();
    return result.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) => result as AuthenticationResult);
  }
}
