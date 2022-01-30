import 'package:agence_teste/app/core/errors/errors.dart';
import 'package:agence_teste/app/modules/login/infrastructure/datasources/auth_datasource.dart';
import 'package:agence_teste/app/modules/login/infrastructure/models/authentication_result_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseLogin implements AuthDatasource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;
  final FacebookAuth facebookLogin;
  FirebaseLogin(this.auth, this.googleSignIn, this.facebookLogin);
  @override
  Future<AuthenticationResult> loginWithGoogle() async {
    final GoogleSignInAccount? result = await googleSignIn.signIn();

    User? user;

    if (result != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await result.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        Left(Failure(message: e.message));
      }
    } else {
      Left(Failure(message: 'Erro in Google Dependence'));
    }
    return AuthenticationResult(user!.displayName!, await user.getIdToken());
  }

  @override
  Future<AuthenticationResult> loginWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    User? user;
    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        Left(Failure(message: e.message));
      }
    }
    return AuthenticationResult(user!.displayName!, await user.getIdToken());
  }

  @override
  Future<AuthenticationResult> loginWithEmailAndPassword(
      String email, String password) async {
    User? user;
    try {
      final UserCredential userCredential = await auth
          .signInWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      Left(Failure(message: e.message));
    }
    return AuthenticationResult(user!.displayName!, await user.getIdToken());
  }

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
}
