// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$controllerEmailAtom =
      Atom(name: '_LoginControllerBase.controllerEmail');

  @override
  TextEditingController get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  final _$controllerPasswordAtom =
      Atom(name: '_LoginControllerBase.controllerPassword');

  @override
  TextEditingController get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  final _$loginWithGoogleAsyncAction =
      AsyncAction('_LoginControllerBase.loginWithGoogle');

  @override
  Future loginWithGoogle() {
    return _$loginWithGoogleAsyncAction.run(() => super.loginWithGoogle());
  }

  final _$loginWithFacebookAsyncAction =
      AsyncAction('_LoginControllerBase.loginWithFacebook');

  @override
  Future loginWithFacebook() {
    return _$loginWithFacebookAsyncAction.run(() => super.loginWithFacebook());
  }

  final _$loginWithEmailAndPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.loginWithEmailAndPassword');

  @override
  Future loginWithEmailAndPassword(String email, String password) {
    return _$loginWithEmailAndPasswordAsyncAction
        .run(() => super.loginWithEmailAndPassword(email, password));
  }

  final _$createAccountWithEmailAndPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.createAccountWithEmailAndPassword');

  @override
  Future createAccountWithEmailAndPassword(String email, String password) {
    return _$createAccountWithEmailAndPasswordAsyncAction
        .run(() => super.createAccountWithEmailAndPassword(email, password));
  }

  final _$recoveryPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.recoveryPassword');

  @override
  Future recoveryPassword(String email) {
    return _$recoveryPasswordAsyncAction
        .run(() => super.recoveryPassword(email));
  }

  @override
  String toString() {
    return '''
controllerEmail: ${controllerEmail},
controllerPassword: ${controllerPassword}
    ''';
  }
}
