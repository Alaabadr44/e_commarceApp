import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repositories/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final _auth = FirebaseAuth.instance;

  @override
  Future<Either<Exception, UserCredential>> loginWithEmailAdPassword({
    required String email,
    required String password,
  }) async {
    try {
      return right(
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } catch (e) {
      return left(
        Exception("something wrong .... "),
      );
    }
  }

  @override
  Future<Either<Exception, UserCredential>> loginWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return right(await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential));
    } catch (e) {
      return left(Exception("something wrong "));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } catch (e) {
      return left(Exception("something wrong "));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> signUpWithNameAndEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      return right(
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } catch (e) {
      return left(
        Exception("something wrong .... "),
      );
    }
  }

  @override
  Stream<User?> userChanges() {
    return _auth.authStateChanges();
  }

  @override
  Future<Either<Exception, void>> logout() async {
    try {
      return right(await _auth.signOut());
    } catch (e) {
      return left(
        Exception("something wrong .... "),
      );
    }
  }
}
