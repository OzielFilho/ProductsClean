import 'package:agence_teste/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key) {
    Modular.get<AppController>().getLoggedUser().then((v) {
      return Future.delayed(const Duration(seconds: 5));
    }).then((value) {
      Modular.to.pushReplacementNamed('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://cdn4.iconfinder.com/data/icons/google-i-o-2016/512/google_firebase-2-512.png',
          height: MediaQuery.of(context).size.height * 0.4,
        ),
      ),
    );
  }
}
