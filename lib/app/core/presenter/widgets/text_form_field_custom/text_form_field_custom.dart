import 'package:flutter/material.dart';

class CustomTextFormFieldCustom extends StatelessWidget {
  final String hint;
  final bool issecured;
  final Icon icon;
  final TextEditingController controllerText;
  const CustomTextFormFieldCustom(
      {Key? key,
      required this.hint,
      required this.issecured,
      required this.icon,
      required this.controllerText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: TextFormField(
          controller: controllerText,
          keyboardType:
              issecured ? TextInputType.visiblePassword : TextInputType.text,
          obscureText: issecured,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(25),
              ),
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.headline2,
              suffixIcon: icon,
              filled: true,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              fillColor: Theme.of(context).splashColor.withOpacity(.5),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(25),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(25),
              )),
        ));
  }
}
