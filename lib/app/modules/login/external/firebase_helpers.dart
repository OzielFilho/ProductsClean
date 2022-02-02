import '../infrastructure/datasources/account_helpers_datasource.dart';
import '../infrastructure/models/user_result_logged.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelpersAccount implements AccountHelpersDataSource {
  final FirebaseAuth auth;

  FirebaseHelpersAccount(this.auth);
  @override
  Future<void> recoveryPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (_) {
      FirebaseException(plugin: 'Error');
    }
  }

  @override
  Future<UserResultLogged> getUserLogged() async {
    User? user;
    try {
      user = auth.currentUser!;
    } on FirebaseAuthException catch (_) {
      FirebaseException(plugin: 'Error');
    }
    return UserResultLogged(
        user!.displayName ?? user.email!.substring(0, 5),
        user.phoneNumber ?? '',
        user.email!,
        user.photoURL ??
            'https://cdn.neemo.com.br/uploads/settings_webdelivery/logo/3957/image-not-found.jpg');
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }
}
