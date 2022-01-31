import 'package:agence_teste/app/app_controller.dart';
import 'package:agence_teste/app/modules/home/presenter/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TextButton(
          onPressed: () => Modular.get<AppController>().logout(),
          child: const Text('Logout')),
    );
  }
}
