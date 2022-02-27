import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../widgets/bars.dart';
import '../../../../checkout/design/screens/checkoutScreen/checkout_screen.dart';
import '../../widgets/widgets.dart';

class HomePageCartBody extends StatelessWidget {
  const HomePageCartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            color: Colors.white,
            height: 645.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16.h);
              },
              itemBuilder: (BuildContext context, int index) {
                return HomePageCartItem(
                  favoritesSwap: () {},
                  deleteSwap: () {},
                );
              },
            ),
          ),
          AddToCartBar(
            priceWord: "TOTAL",
            price: 4500,
            actionWord: "CHECKOUT",
            actionPress: () {
              Get.toNamed(CheckoutOrderScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
