import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../manger/auth_view_model.dart';
import 'widgets/body.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/SignUpScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x0fffffff),
              Color(0xffF5F5F5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 62.h),
              Center(
                child: Container(
                  height: 563.h,
                  width: 344.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 25,
                        color: const Color(0xff242424).withOpacity(0.15),
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: GetBuilder<AuthViewModel>(
                    // init: AuthViewModel(Get.find<AuthRepo>()),
                    // initState: (_) {},
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16.h),
                          const SignUpWord(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SignUpScreenFormFiled(
                              nameController: controller.signUpNameController,
                              emilController: controller.emailController,
                              passwordController: controller.passwordController,
                              formKey: controller.signUpKey,
                            ),
                          ),
                          SizedBox(height: 50.h),
                          SignUpScreenSignUpButton(
                            onTap: () async {
                              if (controller.signUpKey.currentState!
                                  .validate()) {
                                await controller.signUp();
                                // print("done");
                                // Get.offNamed(HomeScreen.routeName);
                              }
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
