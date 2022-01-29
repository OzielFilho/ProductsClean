import 'package:agence_teste/app/core/utils/theme/theme_data_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agence Teste',
      debugShowCheckedModeBanner: false,
      theme: ThemeDataCustom().theme,
      builder: asuka.builder,
    ).modular();
  }
}
