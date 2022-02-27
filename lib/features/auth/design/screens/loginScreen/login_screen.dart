import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../home/design/screens/mainPage/main_page.dart';
import '../../manger/auth_view_model.dart';
import 'widgets/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = '/LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0x0fffffff),
            Color(0xffF5F5F5),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                const LoginScreenShadowBox(),
                SizedBox(height: 33.h),
                LoginScreenRestBody(
                  signGoogle: () async {
                    await AuthViewModel.to.signInWithGoogle();
                    Get.offAllNamed(HomeScreen.routeName);
                  },
                  signFacebook: () async {
                     await AuthViewModel.to.signInWithFacebook();
                    Get.offAllNamed(HomeScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
