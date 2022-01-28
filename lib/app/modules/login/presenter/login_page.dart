import 'package:agence_teste/app/modules/login/presenter/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('login'),
        onPressed: () async {
          print('aqui');
          await controller.loginWithFacebook().then((v) => print(v));
        },
      ),
    );
  }
}
