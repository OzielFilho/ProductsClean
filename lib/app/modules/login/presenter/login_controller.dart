import 'package:agence_teste/app/modules/login/domain/usecases/auth_user.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';

import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class Logincontroller = _LogincontrollerBase with _$Logincontroller;

abstract class _LogincontrollerBase with Store {
  final AuthUser authUser;

  _LogincontrollerBase(this.authUser);

  @action
  login() async {
    var result = await authUser();
    return result.fold((failure) => failure, (result) => result as LoginResult);
  }
}
