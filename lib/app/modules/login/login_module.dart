import 'package:agence_teste/app/core/utils/functions/showLoading.dart';
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
import 'domain/usecases/recovery_password.dart';
import 'external/firebase_login.dart';
import 'infrastructure/repositories/auth_repository_impl.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => GoogleSignIn()),
        Bind((i) => FirebaseLogin(
            FirebaseAuth.instance, i<GoogleSignIn>(), FacebookAuth.instance)),
        Bind((i) => AuthRepositoryImpl(i<FirebaseLogin>())),
        Bind((i) => LoginWithGoogleImpl(i<AuthRepositoryImpl>())),
        Bind((i) => LoginWithFacebookImpl(i<AuthRepositoryImpl>())),
        Bind((i) => LoginWithEmailAndPasswordImpl(i<AuthRepositoryImpl>())),
        Bind((i) =>
            CreateAccountWithEmailAndPasswordImpl(i<AuthRepositoryImpl>())),
        Bind((i) => RecoveryPasswordImpl(i<AuthRepositoryImpl>())),
        Bind((i) => LoadingDialogImpl()),
        Bind((i) => LoginController(
            i<LoginWithGoogleImpl>(),
            i<LoginWithFacebookImpl>(),
            i<LoginWithEmailAndPasswordImpl>(),
            i<CreateAccountWithEmailAndPasswordImpl>(),
            i<RecoveryPasswordImpl>(),
            i<LoadingDialogImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const LoginPage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
      ];
}
