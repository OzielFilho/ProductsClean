import 'package:agence_teste/app/core/widgets/buttom_custom/buttom_custom.dart';
import 'package:agence_teste/app/modules/login/presenter/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ButtomCustom(
              title: 'Login',
              onTap: () {
                controller.loginWithEmailAndPassword(
                    controller.controllerEmail.text,
                    controller.controllerPassword.text);
              }),
          ButtomCustom(
            title: 'Login with Google',
            onTap: controller.loginGoogle,
            icon: const Icon(FontAwesomeIcons.google),
          ),
          ButtomCustom(
            title: 'Login with Facebook',
            onTap: controller.loginFacebook,
            icon: const Icon(FontAwesomeIcons.facebook),
          )
        ],
      ),
    ));
  }
}
