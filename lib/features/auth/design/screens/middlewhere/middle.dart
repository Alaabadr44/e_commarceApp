import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../home/design/screens/mainPage/main_page.dart';
import '../../../domain/repositories/auth_repo.dart';
import '../../manger/auth_view_model.dart';
import '../loginScreen/login_screen.dart';

class AuthMiddleW extends StatelessWidget {
  const AuthMiddleW({Key? key}) : super(key: key);
  static String routeName = '/AuthMiddleW';
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AuthViewModel(Get.find<AuthRepo>()));

    return Scaffold(
      body: StreamBuilder<User?>(
        stream: AuthViewModel.to.isSignedIn() ,
        // initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print("ooo" + snapshot.data.toString());
          if (snapshot.hasData) {
            Get.offNamed( HomeScreen.routeName);
            // return const HomeScreen();
          }
          Get.offNamed(LoginScreen.routeName);
          // return const LoginScreen();
          return Container();
        },
      ),
    )

        // GetBuilder<AuthViewModel>(
        //     init: AuthViewModel(AuthRepoImp()),
        //     builder: (controller) {
        //       // print(controller.user);

        //       // print(" con is " + (controller.user == null).toString());
        //       return controller.user == null
        //           ? const LoginScreen()
        //           : const HomeScreen();
        //       // : const LoginScreen();
        //     })
        ;
  }
}
