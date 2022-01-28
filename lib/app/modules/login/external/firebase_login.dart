import 'package:agence_teste/app/modules/login/infrastructure/datasources/login_datasource.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/login_result_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseLogin implements LoginDatasource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  FirebaseLogin(this.auth, this.googleSignIn);
  @override
  Future<LoginResult> loginWithGoogle() async {
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

  @override
  Future<LoginResult> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }
}
