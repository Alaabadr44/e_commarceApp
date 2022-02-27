import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../utils/colors.dart';
import '../../../../../../../utils/text_style.dart';

class CheckoutAddressScreen extends StatelessWidget {
  const CheckoutAddressScreen({
    Key? key,
    this.isShow = false,
  }) : super(key: key);
  final bool isShow;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isShow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundColor: premiumColor,
                child: const Center(
                  child: Icon(
                    Icons.done_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              const TextNormal14(
                "Billing address is the same as delivery address",
                // textColor: Colors.black,
                // fontSize: 14.sp,
              ),
            ],
          ),
          SizedBox(height: 31.h),
          CheckoutScreenFromField(
            controller: TextEditingController(),
            fieldText: "Street 1",
            hintText: "21, Alex Davidson Avenue",
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 38.h),
            child: CheckoutScreenFromField(
              controller: TextEditingController(),
              fieldText: "Street 2",
              hintText: "Opposite Omegatron, Vicent Quarters",
            ),
          ),
          CheckoutScreenFromField(
            controller: TextEditingController(),
            fieldText: "City",
            hintText: "Victoria Island",
          ),
          SizedBox(height: 38.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 70.h,
                width: 153.w,
                child: CheckoutScreenFromField(
                  controller: TextEditingController(),
                  fieldText: "State",
                  hintText: "Lagos State",
                ),
              ),
              SizedBox(
                height: 70.h,
                width: 153.w,
                child: CheckoutScreenFromField(
                  controller: TextEditingController(),
                  fieldText: "Country",
                  hintText: "Nigeria",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckoutScreenFromField extends StatelessWidget {
  const CheckoutScreenFromField({
    Key? key,
    this.validator,
    required this.controller,
    this.onFieldSubmitted,
    this.onSaved,
    required this.fieldText,
    required this.hintText,
  }) : super(key: key);

  final String fieldText;
  final String hintText;
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
      ));
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNormal14(
          fieldText,
          // textColor: Colors.black,
          // fontSize: 14.sp,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            border: disabledBorderStyle,
            enabledBorder: disabledBorderStyle,
            focusedBorder: mainBorderStyle,
            disabledBorder: disabledBorderStyle,
          ),
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          controller: controller,
          cursorColor: premiumColor,
        ),
      ],
    );
  }
}
