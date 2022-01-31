import 'package:agence_teste/app/core/presenter/widgets/loading/showLoading.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_email_and_password.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_facebook.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoadingDialog loading;
  final LoginWithGoogle loginWithGoogle;
  final LoginWithFacebook loginFacebook;
  final LoginWithEmailAndPassword loginWithEmail;

  _LoginControllerBase(this.loginWithGoogle, this.loginFacebook,
      this.loginWithEmail, this.loading);

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @action
  loginGoogle() async {
    final result = await loginWithGoogle();
    return result.fold(
      (failure) =>
          asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
      (result) => Modular.to.pushReplacementNamed('/home/'),
    );
  }

  @action
  loginWithFacebook() async {
    final result = await loginFacebook();
    return result.fold(
      (failure) =>
          asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
      (result) => Modular.to.pushReplacementNamed('/home/'),
    );
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
      (result) => Modular.to.pushReplacementNamed('/home/'),
    );
  }
}
