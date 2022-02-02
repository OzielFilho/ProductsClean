import '../../../../../core/presenter/widgets/buttom_custom/buttom_custom.dart';
import '../../../../../core/presenter/widgets/text_form_field_custom/text_form_field_custom.dart';
import '../../../../../core/utils/functions/validations.dart';
import 'create_account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState
    extends ModularState<CreateAccountPage, CreateAccountPageController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
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
                  'Insert your email and password to create an account in app',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormFieldCustom(
                  controllerText: controller.emailCreate,
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
                  controllerText: controller.passwordCreate,
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
                CustomTextFormFieldCustom(
                  controllerText: controller.passwordCreateConfirme,
                  hint: 'Confirme your Password',
                  valid: (value) {
                    if (!Validations(value).isPassword) {
                      return 'Password is Invalid';
                    }
                    if (!Validations(value)
                        .equatablePassword(controller.passwordCreate.text)) {
                      return 'Passwords do not match';
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
                    title: 'Create Account',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        controller.createAccountWithEmailAndPassword(
                            controller.emailCreate.text,
                            controller.passwordCreateConfirme.text);
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
