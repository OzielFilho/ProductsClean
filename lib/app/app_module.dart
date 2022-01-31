import 'package:agence_teste/app/core/presenter/pages/splash_page.dart';
import 'package:agence_teste/app/modules/home/home_module.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:agence_teste/app/modules/login/domain/usecases/logout_user.dart';
import 'package:agence_teste/app/modules/login/infrastructure/repositories/auth_repository_impl.dart';
import 'package:agence_teste/app/modules/login/login_module.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app_controller.dart';
import 'core/presenter/widgets/loading/showLoading.dart';
import 'modules/login/external/firebase_login.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseLogin(
            FirebaseAuth.instance, GoogleSignIn(), FacebookAuth.instance)),
        Bind((i) => AuthRepositoryImpl(i<FirebaseLogin>())),
        Bind((i) => GetLoggedUserImpl(i<AuthRepositoryImpl>())),
        Bind((i) => LogoutUserImpl(i<AuthRepositoryImpl>())),
        Bind((i) => LoadingDialogImpl()),
        Bind((i) => AppController(i(), i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => SplashScreenPage(),
          transition: TransitionType.leftToRightWithFade,
          duration: const Duration(milliseconds: 500),
        ),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.leftToRightWithFade,
          duration: const Duration(milliseconds: 500),
        ),
        ModuleRoute(
          '/login',
          module: LoginModule(),
          transition: TransitionType.leftToRightWithFade,
          duration: const Duration(milliseconds: 500),
        ),
      ];
}
