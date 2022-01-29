import 'package:agence_teste/app/core/presenter/widgets/buttom_custom/buttom_custom.dart';
import 'package:agence_teste/app/core/presenter/widgets/text_form_field_custom/text_form_field_custom.dart';
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn4.iconfinder.com/data/icons/google-i-o-2016/512/google_firebase-2-512.png',
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            CustomTextFormFieldCustom(
              controllerText: controller.controllerEmail,
              hint: 'Email',
              issecured: false,
              icon: Icon(
                Icons.email,
                color: Theme.of(context).splashColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormFieldCustom(
              controllerText: controller.controllerPassword,
              hint: 'Password',
              issecured: true,
              icon: Icon(
                Icons.lock,
                color: Theme.of(context).splashColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtomCustom(
                title: 'Login',
                onTap: () {
                  controller.loginWithEmailAndPassword(
                      controller.controllerEmail.text,
                      controller.controllerPassword.text);
                }),
            const SizedBox(
              height: 15,
            ),
            ButtomCustom(
              title: 'Login with Google',
              onTap: controller.loginGoogle,
              icon: const Icon(FontAwesomeIcons.google),
            ),
            ButtomCustom(
              title: 'Login with Facebook',
              onTap: controller.loginFacebook,
              icon: const Icon(FontAwesomeIcons.facebook),
            ),
            TextButton(
                onPressed: () =>
                    controller.createAccountWithEmailAndPassword('', ''),
                child: const Text('Create Account in App')),
            TextButton(
                onPressed: () => controller.recoveryPassword(''),
                child: const Text('Forgot my Password!'))
          ],
        ),
      ),
    ));
  }
}
