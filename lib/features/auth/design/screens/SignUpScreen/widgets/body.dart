import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../../../../../utils/text_style.dart';
import '../../../common_widgets/buttons.dart';
import '../../../common_widgets/text_from_field.dart';

class SignUpScreenFormFiled extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emilController;
  final TextEditingController passwordController;

  const SignUpScreenFormFiled({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.emilController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: 47.h),
          CustomTextFromFelid(
            labelText: "Name",
            controller: nameController,
            isLastFelid: false,
            validator: (value) {
              if (value != null && !GetUtils.isUsername(value)) {
                return " invalid user name";
              }
              return null;
            },
          ),
          SizedBox(height: 38.h),
          CustomTextFromFelid(
            labelText: "Email",
            isEmail: true,
            controller: emilController,
            isLastFelid: false,
            validator: (value) {
              if (value != null && !GetUtils.isEmail(value)) {
                return " not Valid Email";
              }
              return null;
            },
          ),
          SizedBox(height: 38.h),
          CustomTextFromFelid(
            labelText: "password",
            isPassword: true,
            controller: passwordController,
            isLastFelid: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return " not Valid password";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class SignUpWord extends StatelessWidget {
  const SignUpWord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.only(
          start: 16.w,
          top: 11.h,
        ),
        child:
            //30 bold black
            const TextBold30(
          "Sign Up",
          // style: Theme.of(context).textTheme.headline1,
        ));
  }
}

class SignUpScreenSignUpButton extends StatelessWidget {

  const SignUpScreenSignUpButton({Key? key ,required this.onTap})
      : super(key: key);
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainButton(
        buttonText: "SIGN UP",
        onPressed: onTap,
      ),
    );
  }
}
