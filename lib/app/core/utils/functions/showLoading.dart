import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';

abstract class LoadingDialog {
  void show();
  Future<void> hide();
}

class LoadingDialogImpl implements LoadingDialog {
  OverlayEntry? _entry;

  LoadingDialogImpl() {
    _entry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Theme.of(context).backgroundColor.withOpacity(.5),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Future<void> hide() async {
    _entry!.remove();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  void show() {
    FocusManager.instance.primaryFocus?.unfocus();
    asuka.addOverlay(_entry!);
  }
}
