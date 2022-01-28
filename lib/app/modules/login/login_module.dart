import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:agence_teste/app/modules/login/presenter/login_controller.dart';
import 'package:agence_teste/app/modules/login/presenter/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'external/firebase_login.dart';
import 'infrastructure/repositories/login_repository.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => GoogleSignIn()),
        Bind((i) => FirebaseLogin(FirebaseAuth.instance, i<GoogleSignIn>())),
        Bind((i) => LoginRepositoryImpl(i<FirebaseLogin>())),
        Bind((i) => LoginWithGoogleImpl(i<LoginRepositoryImpl>())),
        Bind((i) => LoginController(
              i<LoginWithGoogleImpl>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const LoginPage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
      ];
}
