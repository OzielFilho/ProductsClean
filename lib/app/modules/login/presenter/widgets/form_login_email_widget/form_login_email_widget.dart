import '../../../../../core/presenter/widgets/buttom_custom/buttom_custom.dart';
import '../../../../../core/presenter/widgets/text_form_field_custom/text_form_field_custom.dart';
import '../../../../../core/utils/functions/validations.dart';
import '../../login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FormLoginEmailWidget extends StatelessWidget {
  FormLoginEmailWidget({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Modular.get<LoginController>();
  final TextEditingController controllerEmail = TextEditingController();

  final TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormFieldCustom(
              controllerText: controllerEmail,
              hint: 'Email',
              issecured: false,
              valid: (value) {
                if (!Validations(value).isEmail) {
                  return 'Email is invalid';
                }
              },
              icon: Icon(
                Icons.email,
                color: Theme.of(context).splashColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormFieldCustom(
              controllerText: controllerPassword,
              hint: 'Password',
              valid: (value) {
                if (!Validations(value).isPassword) {
                  return 'Password is Invalid';
                }
              },
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
                  if (_formKey.currentState!.validate()) {
                    controller.loginWithEmailAndPassword(
                        controllerEmail.text, controllerPassword.text);
                  }
                }),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
