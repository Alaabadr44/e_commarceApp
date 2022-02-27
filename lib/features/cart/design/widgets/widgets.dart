import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text_style.dart';

class HomePageCartItem extends StatelessWidget {
  const HomePageCartItem({
    Key? key,
    this.favoritesSwap,
    this.deleteSwap,
    this.productName,
    this.categoryName,
    this.productImageUrl,
    this.onAddPress,
    this.onMinPress,
    this.numberOfProduct,
    this.productPrice,
  }) : super(key: key);

  final VoidCallback? favoritesSwap;
  final VoidCallback? deleteSwap;
  final String? productName;
  final String? categoryName;
  final String? productImageUrl;
  final VoidCallback? onAddPress;
  final VoidCallback? onMinPress;
  final int? numberOfProduct;
  final int? productPrice;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.startToEnd && favoritesSwap != null) {
          // to favorites
          favoritesSwap!();
        } else {
          // to delete
          if (deleteSwap != null) deleteSwap!();
        }
      },
      background: Container(
        color: const Color(0xffFFC107),
        padding: EdgeInsetsDirectional.only(start: 33.w),
        alignment: AlignmentDirectional.centerStart,
        child: const Icon(
          Icons.star,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        color: const Color(0xffFF3D00),
        padding: EdgeInsetsDirectional.only(end: 33.w),
        alignment: AlignmentDirectional.centerEnd,
        child: const Icon(
          Icons.delete_forever_outlined,
          color: Colors.white,
        ),
      ),
      key: productName != null ? Key(productName!) : UniqueKey(),
      child: Container(
        height: 123.h,
        width: 343.w,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(
              height: 120.h,
              width: 120.w,
              child: productImageUrl != null
                  ? Image.network(
                      productImageUrl!,
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      cartImageSimple,
                      fit: BoxFit.fill,
                    ),
            ),
            SizedBox(width: 30.w),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextMedium16(
                    productName ?? "Tag Heuer Wristwatch",
                    // style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 3.h),

                  //  premiumColor

                  TextMedium16(
                    productPrice != null
                        ? ("\$+" + productPrice.toString())
                        : "\$1100",
                    // style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: premiumColor,
                    // ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: 100.5.w,
                    height: 30.3.h,
                    color: Colors.black.withOpacity(0.06),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: onAddPress ?? () {},
                            icon: const Icon(Icons.add),
                            iconSize: 15.sp,
                          ),
                          TextNormal14(
                            numberOfProduct != null
                                ? numberOfProduct.toString()
                                : "3",
                            // style: Theme.of(context).textTheme.bodyText1,
                          ),
                          IconButton(
                            onPressed: onMinPress ?? () {},
                            icon: const Icon(Icons.remove),
                            iconSize: 15.sp,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
