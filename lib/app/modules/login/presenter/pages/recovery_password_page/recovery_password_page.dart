import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/presenter/widgets/buttom_custom/buttom_custom.dart';
import '../../../../../core/presenter/widgets/text_form_field_custom/text_form_field_custom.dart';
import '../../../../../core/utils/functions/validations.dart';
import 'recovery_password_page_controller.dart';

class RecoveryPasswordPage extends StatefulWidget {
  const RecoveryPasswordPage({Key? key}) : super(key: key);

  @override
  State<RecoveryPasswordPage> createState() => _RecoveryPasswordPageState();
}

class _RecoveryPasswordPageState
    extends ModularState<RecoveryPasswordPage, RecoveryPasswordPageController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recovery Password'),
        leading: IconButton(
            onPressed: () => Modular.to.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Text(
                  'Insert your email to recovery your password',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFieldCustom(
                  controllerText: controller.emailRecovery,
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
                ButtomCustom(
                    title: 'Recovery Password',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller
                            .recoveryPassword(controller.emailRecovery.text);
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
