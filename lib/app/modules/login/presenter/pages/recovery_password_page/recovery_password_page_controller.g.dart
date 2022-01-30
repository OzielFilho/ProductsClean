// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_password_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoveryPasswordPageController
    on _RecoveryPasswordPageControllerBase, Store {
  final _$emailRecoveryAtom =
      Atom(name: '_RecoveryPasswordPageControllerBase.emailRecovery');

  @override
  TextEditingController get emailRecovery {
    _$emailRecoveryAtom.reportRead();
    return super.emailRecovery;
  }

  @override
  set emailRecovery(TextEditingController value) {
    _$emailRecoveryAtom.reportWrite(value, super.emailRecovery, () {
      super.emailRecovery = value;
    });
  }

  final _$recoveryPasswordAsyncAction =
      AsyncAction('_RecoveryPasswordPageControllerBase.recoveryPassword');

  @override
  Future recoveryPassword(String email) {
    return _$recoveryPasswordAsyncAction
        .run(() => super.recoveryPassword(email));
  }

  @override
  String toString() {
    return '''
emailRecovery: ${emailRecovery}
    ''';
  }
}
