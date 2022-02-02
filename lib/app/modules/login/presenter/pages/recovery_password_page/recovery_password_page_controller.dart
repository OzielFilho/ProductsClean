import '../../../../../core/presenter/widgets/loading/showLoading.dart';
import '../../../domain/usecases/recovery_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
part 'recovery_password_page_controller.g.dart';

class RecoveryPasswordPageController = _RecoveryPasswordPageControllerBase
    with _$RecoveryPasswordPageController;

abstract class _RecoveryPasswordPageControllerBase with Store {
  final LoadingDialog loading;

  final RecoveryPassword recoveryPasswordI;
  _RecoveryPasswordPageControllerBase(this.loading, this.recoveryPasswordI);

  @observable
  TextEditingController emailRecovery = TextEditingController();

  @action
  recoveryPassword(String email) async {
    loading.show();
    await Future.delayed(const Duration(seconds: 1));
    final result = await recoveryPasswordI(email);
    await loading.hide();
    return result.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) {
      Modular.to.pop();
      asuka.showSnackBar(SnackBar(
          content: Text(
              'In a few minutes you will receive an email with information to recovery password. Email Send to $email')));
    });
  }
}
