import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Exception, UserCredential>> loginWithEmailAdPassword({
    required String email,
    required String password,
  });
  Future<Either<Exception, UserCredential>> loginWithGoogle();
  Future<Either<Exception, UserCredential>> loginWithFacebook();
  Future<Either<Exception, UserCredential>> signUpWithNameAndEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Stream<User?> userChanges();

  Future<Either<Exception, void>> logout();
}
