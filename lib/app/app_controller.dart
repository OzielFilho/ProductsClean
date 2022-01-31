import 'package:agence_teste/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/logout_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'core/presenter/widgets/loading/showLoading.dart';
import 'modules/login/infrastructure/models/user_result_logged.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final GetLoggedUser loggedUser;
  final LoadingDialog loading;
  final LogoutUser logoutUser;
  _AppControllerBase(this.loggedUser, this.logoutUser, this.loading);

  @action
  getLoggedUser() async {
    final result = await loggedUser();
    return result.fold((failure) => Modular.to.pushReplacementNamed('/login/'),
        (result) => result as UserResultLogged);
  }

  @action
  logout() async {
    loading.show();
    await Future.delayed(const Duration(seconds: 1));
    final result = await logoutUser();
    await loading.hide();
    return result.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) => Modular.to.pushReplacementNamed('/login/'));
  }
}
