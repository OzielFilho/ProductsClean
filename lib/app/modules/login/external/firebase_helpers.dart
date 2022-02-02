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
    return UserResultLogged(user!.displayName!, user.phoneNumber ?? '',
        user.email!, user.photoURL!);
  }

  @override
  Future<void> logout() async {
    return await auth.signOut();
  }
}
