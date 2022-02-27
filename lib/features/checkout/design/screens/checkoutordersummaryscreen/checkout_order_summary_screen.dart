import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../utils/colors.dart';
import '../../../../../../utils/text_style.dart';
import '../../widgets/widgets.dart';

class CheckoutOrderSummaryBody extends StatelessWidget {
  const CheckoutOrderSummaryBody({
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
          SizedBox(
            height: 197.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 17.w);
              },
              itemBuilder: (BuildContext context, int index) {
                return const CheckoutOrderSummaryProductItem(
                  isApi: false,
                );
              },
            ),
          ),
          SizedBox(height: 25.h),
          const Divider(),
          SizedBox(height: 22.h),
          CheckoutOrderSummaryAddress(
            address:
                "21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria",
            changePress: () {},
          )
        ],
      ),
    );
  }
}

class CheckoutOrderSummaryAddress extends StatelessWidget {
  const CheckoutOrderSummaryAddress({
    Key? key,
    required this.address,
    this.changePress,
  }) : super(key: key);

  final String address;
  final void Function()? changePress;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextBold18(
          "Shipping Address",
        ),
        SizedBox(height: 19.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 286.w,
              child: TextNormal16(
                address,
                // textColor: Colors.black,
                // fontSize: 16.sp,
              ),
            ),
            CircleAvatar(
              radius: 15.r,
              backgroundColor: premiumColor,
              child: const Center(
                child: Icon(
                  Icons.done_sharp,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10.h),
        TextButton(
          onPressed: changePress ?? () {},
          child: const TextMedium14(
            "Change",
            color: premiumColor,
            // fontSize: 14.sp,
            // fontWeight: FontWeight.w500,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
