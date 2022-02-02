import 'package:firebase_auth/firebase_auth.dart';

import '../infrastructure/datasources/create_account_datasource.dart';

class FirebaseCreateAccount implements CreateAccountDatasource {
  final FirebaseAuth auth;

  FirebaseCreateAccount(this.auth);

  @override
  Future<void> createAccountWithEmailAndPassword(
      String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      FirebaseException(plugin: 'Error');
    }
  }
}
