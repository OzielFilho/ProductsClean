// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$loginGoogleAsyncAction =
      AsyncAction('_LoginControllerBase.loginGoogle');

  @override
  Future loginGoogle() {
    return _$loginGoogleAsyncAction.run(() => super.loginGoogle());
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

  @override
  String toString() {
    return '''

    ''';
  }
}
