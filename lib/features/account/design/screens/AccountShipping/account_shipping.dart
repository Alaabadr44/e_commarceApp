import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/text_style.dart';
import '../../../../checkout/design/widgets/buttons.dart';
import '../../manger/manger/account_view_model.dart';

class AccountShipping extends StatelessWidget {
  const AccountShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const TextNormal20(
          "Shipping Address",
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
            size: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GetBuilder<AccountViewModel>(
          init: AccountViewModel(),
          // initState: (_) {},
          builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                AccountShippingAddressItem(
                  isChose: controller.isShow,
                  onTab: controller.onTab,
                ),
                SizedBox(height: 48.h),
                AccountShippingAddressItem(
                  isChose: !controller.isShow,
                  onTab: controller.onTab,
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: CheckoutButton(
                        actionPress: () {},
                        actionWord: "NEW",
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class AccountShippingAddressItem extends StatelessWidget {
  const AccountShippingAddressItem({
    Key? key,
    this.isChose = true,
    this.addressType,
    this.address,
    required this.onTab,
  }) : super(key: key);

  final bool isChose;
  final String? addressType;
  final String? address;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: SizedBox(
        width: 343.w,
        height: 118.h,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: TextBold18(addressType ?? "Home Address"),
                  ),
                ),
                SizedBox(height: 19.h),
                SizedBox(
                  height: 75.h,
                  width: 285.w,
                  child: TextNormal14(address ??
                      "21, Alex Davidson Avenue, Opposite Omegatron, Vicent Smith Quarters, Victoria Island, Lagos, Nigeria"),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                color: isChose ? premiumColor : stepAppColor,
                shape: BoxShape.circle,
              ),
              child: Visibility(
                visible: isChose,
                child: const Icon(
                  Icons.done,
                  color: white,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
