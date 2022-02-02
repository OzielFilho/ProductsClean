import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/presenter/pages/splash_page.dart';
import 'core/presenter/widgets/loading/showLoading.dart';
import 'modules/home/home_module.dart';
import 'modules/login/domain/usecases/get_logged_user.dart';
import 'modules/login/domain/usecases/logout_user.dart';
import 'modules/login/external/firebase_helpers.dart';
import 'modules/login/infrastructure/repositories/account_helpers_repository_impl.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FirebaseHelpersAccount(
              FirebaseAuth.instance,
            )),
        Bind((i) => AccountHelpersRepositoryImpl(i<FirebaseHelpersAccount>())),
        Bind((i) => GetLoggedUserImpl(i<AccountHelpersRepositoryImpl>())),
        Bind((i) => LogoutUserImpl(i<AccountHelpersRepositoryImpl>())),
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
