// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateAccountPageController on _CreateAccountPageControllerBase, Store {
  final _$emailCreateAtom =
      Atom(name: '_CreateAccountPageControllerBase.emailCreate');

  @override
  TextEditingController get emailCreate {
    _$emailCreateAtom.reportRead();
    return super.emailCreate;
  }

  @override
  set emailCreate(TextEditingController value) {
    _$emailCreateAtom.reportWrite(value, super.emailCreate, () {
      super.emailCreate = value;
    });
  }

  final _$passwordCreateAtom =
      Atom(name: '_CreateAccountPageControllerBase.passwordCreate');

  @override
  TextEditingController get passwordCreate {
    _$passwordCreateAtom.reportRead();
    return super.passwordCreate;
  }

  @override
  set passwordCreate(TextEditingController value) {
    _$passwordCreateAtom.reportWrite(value, super.passwordCreate, () {
      super.passwordCreate = value;
    });
  }

  final _$passwordCreateConfirmeAtom =
      Atom(name: '_CreateAccountPageControllerBase.passwordCreateConfirme');

  @override
  TextEditingController get passwordCreateConfirme {
    _$passwordCreateConfirmeAtom.reportRead();
    return super.passwordCreateConfirme;
  }

  @override
  set passwordCreateConfirme(TextEditingController value) {
    _$passwordCreateConfirmeAtom
        .reportWrite(value, super.passwordCreateConfirme, () {
      super.passwordCreateConfirme = value;
    });
  }

  final _$createAccountWithEmailAndPasswordAsyncAction = AsyncAction(
      '_CreateAccountPageControllerBase.createAccountWithEmailAndPassword');

  @override
  Future createAccountWithEmailAndPassword(String email, String password) {
    return _$createAccountWithEmailAndPasswordAsyncAction
        .run(() => super.createAccountWithEmailAndPassword(email, password));
  }

  @override
  String toString() {
    return '''
emailCreate: ${emailCreate},
passwordCreate: ${passwordCreate},
passwordCreateConfirme: ${passwordCreateConfirme}
    ''';
  }
}
