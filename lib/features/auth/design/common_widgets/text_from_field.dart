import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/colors.dart';

class CustomTextFromFelid extends StatelessWidget {
  const CustomTextFromFelid(
      {Key? key,
      this.isPassword = false,
      required this.labelText,
      this.validator,
      required this.controller,
      this.onFieldSubmitted,
      required this.isLastFelid,
      this.onSaved,
      this.isEmail = false})
      : super(key: key);
  final bool isPassword;
  final bool isEmail;
  final bool isLastFelid;
  final String labelText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;

  final mainBorderStyle = const UnderlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: premiumColor,
      width: 1,
    ),
  );
  final disabledBorderStyle = const UnderlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: BorderSide(
      color: Color(0xffDDDDDD),
      width: 1,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: isPassword,
      cursorColor: premiumColor,
      controller: controller,
      validator: validator,
      style: GoogleFonts.sourceSansPro().copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : isEmail
              ? TextInputType.emailAddress
              : null,
      textInputAction: !isLastFelid ? TextInputAction.next : null,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      decoration: InputDecoration(
        border: disabledBorderStyle,
        enabledBorder: disabledBorderStyle,
        focusedBorder: mainBorderStyle,
        disabledBorder: disabledBorderStyle,
        labelText: labelText,
        labelStyle: TextStyle(
          color: greyAppColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
