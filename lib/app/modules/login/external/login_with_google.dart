import 'package:agence_teste/app/modules/login/infrastructure/datasources/login_datasource.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginWithGoogle implements LoginDatasource {
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;

  LoginWithGoogle(this.googleSignIn, this.auth);
  @override
  Future<LoginResult> login() async {
    User? user;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (_) {
        FirebaseException(plugin: 'Error');
      }
    }
    return LoginResult(user!.displayName!, await user.getIdToken());
  }
}
