import 'package:agence_teste/app/core/presenter/widgets/loading/showLoading.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/create_account_with_email_and_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'create_account_page_controller.g.dart';

class CreateAccountPageController = _CreateAccountPageControllerBase
    with _$CreateAccountPageController;

abstract class _CreateAccountPageControllerBase with Store {
  final LoadingDialog loading;
  final CreateAccountWithEmailAndPassword createAccountWithEmail;

  _CreateAccountPageControllerBase(this.createAccountWithEmail, this.loading);

  @observable
  TextEditingController emailCreate = TextEditingController();

  @observable
  TextEditingController passwordCreate = TextEditingController();

  @observable
  TextEditingController passwordCreateConfirme = TextEditingController();

  @action
  createAccountWithEmailAndPassword(String email, String password) async {
    loading.show();
    await Future.delayed(const Duration(seconds: 1));
    final result = await createAccountWithEmail(email, password);
    await loading.hide();
    return result.fold(
      (failure) =>
          asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
      (result) {
        asuka
            .showSnackBar(
                const SnackBar(content: Text('User create with success!')))
            .closed
            .whenComplete(() => Modular.to.pop());
      },
    );
  }
}
