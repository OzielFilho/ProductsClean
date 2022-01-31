import 'package:agence_teste/app/modules/login/domain/entities/logged_user_info.dart';

class UserResultLogged extends LoggedUserInfo {
  UserResultLogged(String name, String phoneNumber, String email)
      : super(name, email, phoneNumber);
}
