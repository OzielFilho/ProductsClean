// ignore_for_file: file_names

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
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor)),
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
