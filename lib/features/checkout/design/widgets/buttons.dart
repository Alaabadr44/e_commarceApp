import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
    required this.actionPress,
    required this.actionWord,
  }) : super(key: key);
  final VoidCallback actionPress;
  final String actionWord;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 146.w,
      child: ElevatedButton(
        onPressed: actionPress,
        child: TextNormal14(
          actionWord,
          // style: Theme.of(context).textTheme.bodyText1,
          color: white,
        ),
        style: ElevatedButton.styleFrom(
          primary: premiumColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}



// back button
class BackButtonStyle extends StatelessWidget {
  const BackButtonStyle({
    Key? key,
    required this.actionPress,
    required this.actionWord,
  }) : super(key: key);

  final VoidCallback actionPress;
  final String actionWord;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 146.w,
      child: ElevatedButton(
        onPressed: actionPress,
        child: TextNormal14(
          actionWord,
          // style: Theme.of(context).textTheme.bodyText1,
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
            side: const BorderSide(
              color: premiumColor,
              width: 1,
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
