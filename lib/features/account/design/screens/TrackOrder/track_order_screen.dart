import 'package:e_commerce_app/features/account/design/screens/ViewOrderItinerary/view_order_itinerary.dart';
import 'package:e_commerce_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/text_style.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const TextNormal20(
          "Track Order",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            const TextNormal14("Sept 23, 2018"),
            SizedBox(height: 15.h),
            TrackOrderCardItem(
              onTap: () {
                Get.to(const ViewOrderItinerary());
              },
            )
          ],
        ),
      ),
    );
  }
}

enum orderStatus {
  inTransit,
  delivered,
}

class TrackOrderCardItem extends StatelessWidget {
  const TrackOrderCardItem({
    Key? key,
    this.orderNumber,
    this.status = orderStatus.inTransit,
    this.orderImg,
    this.orderPrice,
    this.onTap,
    this.isApi = false,
  }) : super(key: key);

  final String? orderNumber;
  final orderStatus? status;
  final String? orderImg;
  final double? orderPrice;
  final bool isApi;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: SizedBox(
          height: 140.h,
          width: 343.w,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              top: 15.h,
              bottom: 15.h,
              start: 20.w,
              end: 20.w,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextMedium16(!isApi ? "OD - 424923192 - N" : orderNumber!),
                    SizedBox(height: 8.h),
                    TextNormal14(
                      !isApi ? "\$4500" : ("\$" + orderPrice.toString()),
                      color: premiumColor,
                    ),
                    SizedBox(height: 27.h),
                    Container(
                      height: 31.h,
                      width: 80.w,
                      color: status == orderStatus.inTransit
                          ? yalowAppColor
                          : premiumColor,
                      child: Center(
                        child: TextMedium14(
                          status == orderStatus.inTransit
                              ? "In Transit"
                              : "Delivered",
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 105.h,
                  width: 105.w,
                  child: Image.asset(
                    mainPageBestSellingImg,
                    fit: BoxFit.fitHeight,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
