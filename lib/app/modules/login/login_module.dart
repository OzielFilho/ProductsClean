import 'package:agence_teste/app/modules/login/presenter/login_controller.dart';
import 'package:agence_teste/app/modules/login/presenter/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'domain/usecases/auth_user.dart';
import 'external/login_with_google.dart';
import 'infrastructure/repositories/login_repository.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => GoogleSignIn()),
        Bind((i) => LoginWithGoogle(i<GoogleSignIn>(), i<FirebaseAuth>())),
        Bind((i) => LoginRepositoryImpl(i<LoginWithGoogle>())),
        Bind((i) => AuthUserImpl(i<LoginRepositoryImpl>())),
        Bind((i) => Logincontroller(
              i<AuthUserImpl>(),
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
