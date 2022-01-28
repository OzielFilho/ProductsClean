import 'package:agence_teste/app/modules/login/domain/usecases/login_with_email_and_password.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:agence_teste/app/modules/login/presenter/login_controller.dart';
import 'package:agence_teste/app/modules/login/presenter/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'domain/usecases/create_account_with_email_and_password.dart';
import 'domain/usecases/login_with_facebook.dart';
import 'external/firebase_login.dart';
import 'infrastructure/repositories/login_repository.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => GoogleSignIn()),
        Bind((i) => FirebaseLogin(
            FirebaseAuth.instance, i<GoogleSignIn>(), FacebookAuth.instance)),
        Bind((i) => LoginRepositoryImpl(i<FirebaseLogin>())),
        Bind((i) => LoginWithGoogleImpl(i<LoginRepositoryImpl>())),
        Bind((i) => LoginWithFacebookImpl(i<LoginRepositoryImpl>())),
        Bind((i) => LoginWithEmailAndPasswordImpl(i<LoginRepositoryImpl>())),
        Bind((i) =>
            CreateAccountWithEmailAndPasswordImpl(i<LoginRepositoryImpl>())),
        Bind((i) => LoginController(
              i<LoginWithGoogleImpl>(),
              i<LoginWithFacebookImpl>(),
              i<LoginWithEmailAndPasswordImpl>(),
              i<CreateAccountWithEmailAndPasswordImpl>(),
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
