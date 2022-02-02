import 'package:flutter/material.dart';

class ShowDialogConfime extends StatelessWidget {
  final VoidCallback onClick;
  final String title;
  final String content;
  const ShowDialogConfime(
      {Key? key,
      required this.onClick,
      required this.title,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text('No', style: Theme.of(context).textTheme.subtitle1),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Yes', style: Theme.of(context).textTheme.subtitle1),
            onPressed: onClick,
          ),
        ],
      ),
    );
  }
}
