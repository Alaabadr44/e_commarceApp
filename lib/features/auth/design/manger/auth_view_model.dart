import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/repositories/auth_repo.dart';
import '../screens/loginScreen/login_screen.dart';

class AuthViewModel extends GetxController {
  static get to => Get.find<AuthViewModel>();

  final AuthRepo repo;

  AuthViewModel(this.repo);

  splashScreenMove() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => Get.offNamed(
        LoginScreen.routeName,
      ),
    );
    // update(["splash"]);
  }

  final Rx<User?> _user = Rx<User?>(null);

  String? get user => _user.value!.email;

  Future signInWithGoogle() async {
    try {
      await repo.loginWithGoogle();
    } catch (erorr) {
      Get.snackbar(
        "Error login with Google",
        erorr.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.blueGrey,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future signInWithFacebook() async {
    try {
      await repo.loginWithFacebook();
    } catch (erorr) {
      Get.snackbar(
        "Error login with facebook",
        erorr.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.blueGrey,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  signOut() async {
    try {
      return await repo.logout();
    } catch (erorr) {
      Get.snackbar(
        "Error SignOut",
        erorr.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.blueGrey,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Stream<User?> isSignedIn() {
    return repo.userChanges();
    //  return null;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey();

  Future signIn() async {
    try {
      await repo.loginWithEmailAdPassword(
          email: emailController.text, password: passwordController.text);
    } catch (erorr) {
      Get.snackbar(
        "Error login",
        erorr.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.blueGrey,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  final TextEditingController signUpemailController = TextEditingController();
  final TextEditingController signUpPasswordController =
      TextEditingController();
  final TextEditingController signUpNameController = TextEditingController();
  final GlobalKey<FormState> signUpKey = GlobalKey();

  Future signUp() async {
    try {
      await repo.signUpWithNameAndEmailAndPassword(
        email: signUpemailController.text,
        password: signUpPasswordController.text,
        name: signUpNameController.text,
      );
    } catch (erorr) {
      Get.snackbar(
        "Error login",
        erorr.toString(),
        colorText: Colors.black,
        backgroundColor: Colors.blueGrey,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
