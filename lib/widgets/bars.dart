import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/checkout/design/widgets/buttons.dart';
import '../../utils/colors.dart';
import '../../utils/text_style.dart';

class AddToCartBar extends StatelessWidget {
  const AddToCartBar({
    Key? key,
    required this.priceWord,
    required this.price,
    required this.actionWord,
    required this.actionPress,
  }) : super(key: key);

  final String priceWord;
  final double price;
  final String actionWord;
  final VoidCallback actionPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 17.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextNormal12(
                priceWord,
                // style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: offWhiteAppColor,
                // ),
              ),
              TextBold18(
                "\$" + price.toString().split(".")[0],
                // style: Theme.of(context).textTheme.headline2!.copyWith(
                color: premiumColor,
                // ),
              )
            ],
          ),
          CheckoutButton(
            actionPress: actionPress,
            actionWord: actionWord,
          ),
        ],
      ),
    );
  }
}
