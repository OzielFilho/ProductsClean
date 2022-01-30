import 'package:flutter/material.dart';

class ButtomCustom extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? backgroundColor;
  final Icon? icon;
  final Alignment? alignment;
  const ButtomCustom(
      {Key? key,
      required this.title,
      required this.onTap,
      this.backgroundColor,
      this.icon,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: SizedBox(
        width: icon != null ? 240 : 168,
        child: MaterialButton(
          height: 45,
          minWidth: 50,
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: icon != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            children: [
              icon ?? Container(),
              Text(title),
            ],
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          color: backgroundColor ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
