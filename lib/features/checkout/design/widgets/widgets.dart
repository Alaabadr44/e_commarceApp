import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text_style.dart';

class CheckoutStatusOptionItem extends StatelessWidget {
  const CheckoutStatusOptionItem({
    Key? key,
    required this.deliveryType,
    required this.deliveredInData,
    required this.onTab,
    this.currentIndex = 1,
    required this.initIndex,
  }) : super(key: key);

  final String deliveryType;
  final String deliveredInData;
  final void Function(int?)? onTab;
  final int currentIndex;
  final int initIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTab!(currentIndex),
      child: SizedBox(
        width: 343.w,
        height: 93.h,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextBold18(
                    deliveryType,
                  ),
                  SizedBox(height: 19.h),
                  SizedBox(
                    width: 285.w,
                    child: TextNormal14(
                      deliveredInData,
                    ),
                  )
                ],
              ),
              SizedBox(width: 34.w),
              Radio<int>(
                value: initIndex,
                groupValue: currentIndex,
                onChanged: onTab,
                activeColor: premiumColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutOrderSummaryProductItem extends StatelessWidget {
  const CheckoutOrderSummaryProductItem({
    Key? key,
    required this.isApi,
    this.productName,
    this.productPrice,
    this.imgUrl,
  }) : super(key: key);

  final bool isApi;
  final String? imgUrl;
  final String? productName;
  final double? productPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      height: 193.h,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //photo
          SizedBox(
            height: 120.h,
            width: 125.w,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: !isApi
                    ? Image.asset(
                        mainPageBestSellingImg,
                        fit: BoxFit.fill,
                        height: 120.h,
                        width: 125.w,
                      )
                    : Image.network(
                        imgUrl!,
                        fit: BoxFit.fill,
                        height: 120.h,
                        width: 125.w,
                      )),
          ),
          SizedBox(height: 10.h),
          TextMedium16(
            productName ?? "BeoPlay Speaker",
          ),
          SizedBox(height: 3.h),
          TextMedium16(
            productPrice != null ? ("\$+" + productPrice.toString()) : "\$1100",
            color: premiumColor,
          ),
        ],
      ),
    );
  }
}
