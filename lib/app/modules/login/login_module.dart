import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/presenter/widgets/loading/showLoading.dart';
import '../home/home_module.dart';
import 'domain/usecases/create_account_with_email_and_password.dart';
import 'domain/usecases/login_with_email_and_password.dart';
import 'domain/usecases/login_with_facebook.dart';
import 'domain/usecases/login_with_google.dart';
import 'domain/usecases/recovery_password.dart';
import 'external/firebase_create_account.dart';
import 'external/firebase_helpers.dart';
import 'external/firebase_login.dart';
import 'infrastructure/repositories/account_helpers_repository_impl.dart';
import 'infrastructure/repositories/auth_repository_impl.dart';
import 'infrastructure/repositories/create_account_repository_impl.dart';
import 'presenter/login_controller.dart';
import 'presenter/login_page.dart';
import 'presenter/pages/create_account_page/create_account_page.dart';
import 'presenter/pages/create_account_page/create_account_page_controller.dart';
import 'presenter/pages/recovery_password_page/recovery_password_page.dart';
import 'presenter/pages/recovery_password_page/recovery_password_page_controller.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseLogin(
            FirebaseAuth.instance, GoogleSignIn(), FacebookAuth.instance)),
        Bind((i) => FirebaseCreateAccount(
              FirebaseAuth.instance,
            )),
        Bind((i) => FirebaseHelpersAccount(
              FirebaseAuth.instance,
            )),
        Bind((i) => AuthRepositoryImpl(i<FirebaseLogin>())),
        Bind((i) => AccountHelpersRepositoryImpl(i<FirebaseHelpersAccount>())),
        Bind((i) => CreateAccountRepositoryImpl(i<FirebaseCreateAccount>())),
        Bind((i) => LoginWithGoogleImpl(i<AuthRepositoryImpl>())),
        Bind((i) => LoginWithFacebookImpl(i<AuthRepositoryImpl>())),
        Bind((i) => LoginWithEmailAndPasswordImpl(i<AuthRepositoryImpl>())),
        Bind((i) => CreateAccountWithEmailAndPasswordImpl(
            i<CreateAccountRepositoryImpl>())),
        Bind((i) => RecoveryPasswordImpl(i<AccountHelpersRepositoryImpl>())),
        Bind((i) => LoadingDialogImpl()),
        Bind((i) => LoginController(
            i<LoginWithGoogleImpl>(),
            i<LoginWithFacebookImpl>(),
            i<LoginWithEmailAndPasswordImpl>(),
            i<LoadingDialogImpl>())),
        Bind((i) => RecoveryPasswordPageController(
              i<LoadingDialogImpl>(),
              i<RecoveryPasswordImpl>(),
            )),
        Bind((i) => CreateAccountPageController(
            i<CreateAccountWithEmailAndPasswordImpl>(),
            i<LoadingDialogImpl>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (_, args) => const LoginPage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
        ModuleRoute(
          '/home',
          module: HomeModule(),
          transition: TransitionType.leftToRightWithFade,
          duration: const Duration(milliseconds: 500),
        ),
        ChildRoute('/create',
            child: (_, args) => const CreateAccountPage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
        ChildRoute('/recovery',
            child: (_, args) => const RecoveryPasswordPage(),
            transition: TransitionType.leftToRightWithFade,
            duration: const Duration(milliseconds: 500)),
      ];
}
