import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../utils/colors.dart';
import '../../../../../../utils/icons.dart';
import '../../../../../../utils/text_style.dart';
import '../../../../../home/design/screens/mainPage/main_page.dart';
import '../../../common_widgets/buttons.dart';
import '../../../common_widgets/text_from_field.dart';
import '../../../manger/auth_view_model.dart';
import '../../SignUpScreen/sign_up_screen.dart';

class LoginScreenRestBody extends StatelessWidget {
  const LoginScreenRestBody({
    Key? key,
    this.signGoogle,
    this.signFacebook,
  }) : super(key: key);

  final VoidCallback? signGoogle;
  final VoidCallback? signFacebook;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          //18 re
          child: TextNormal18(
            "-OR-",
            // style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        SizedBox(height: 43.h),
        SignInWith(
          buttonText: "Sign In with Facebook",
          iconPath: fbIcon,
          onPressed: signFacebook ?? () {},
        ),
        SizedBox(height: 20.h),
        SignInWith(
          buttonText: "Sign In with Google",
          iconPath: googleIcon,
          onPressed: signGoogle ?? () {},
        ),
      ],
    );
  }
}

class LoginScreenShadowBox extends StatelessWidget {
  const LoginScreenShadowBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440.h,
      width: 344.w,
      // padding: const EdgeInsets.only(top: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                color: const Color(0xff242424).withOpacity(0.15),
                offset: const Offset(0, 5))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsetsDirectional.only(end: 10.w, start: 16.w, top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextBold30(
                  "Welcome,",
                  // style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: premiumColor,
                  // ),
                ),
                TextButton(
                  onPressed: () => Get.toNamed(
                    SignUpScreen.routeName,
                  ),
                  child: const TextNormal18(
                    "Sign Up  ",
                    color: premiumColor,
                    // fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child:
                //offWhiteAppColor
                const TextNormal14(
              "Sign in to Continue",
              // style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: offWhiteAppColor,
              // ),
            ),
          ),
          SizedBox(height: 20.h),
          GetBuilder<AuthViewModel>(
            // init: MyController(),
            // initState: (_) {},
            builder: (controller) {
              return Form(
                key: controller.key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      CustomTextFromFelid(
                        isEmail: true,
                        isLastFelid: false,
                        labelText: "Email",
                        controller: controller.emailController,
                        validator: (value) {
                          if (value != null && !GetUtils.isEmail(value)) {
                            return " not Valid Email";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFromFelid(
                        isLastFelid: true,
                        isPassword: true,
                        labelText: "Password",
                        controller: controller.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " not Valid password";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 10),
                            child: TextButton(
                              onPressed: () {},
                              child: const TextNormal14(
                                "Forgot Password?",
                                // style: Theme.of(context).textTheme.bodyText1!,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: MainButton(
                          buttonText: "SIGN IN",
                          onPressed: () async {
                            if (controller.key.currentState!.validate()) {
                              // doing this
                              await controller.signIn();
                               Get.offNamed(HomeScreen.routeName);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
