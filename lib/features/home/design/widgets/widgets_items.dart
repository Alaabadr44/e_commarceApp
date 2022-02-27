import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text_style.dart';

class BottomNavBarWord extends StatelessWidget {
  const BottomNavBarWord({
    Key? key,
    required this.word,
  }) : super(key: key);

  final String word;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextBold14(
          word,
          // style: Theme.of(context).textTheme.headline3,
        ),
        const Center(
          child: TextBold14(
            "*",
            // style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}

class BottomVavBarIcon extends StatelessWidget {
  const BottomVavBarIcon({Key? key, required this.iconPath}) : super(key: key);
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      height: 20.h,
      width: 20.w,
      fit: BoxFit.cover,
    );
  }
}

class HomePageBestSellingItem extends StatelessWidget {
  const HomePageBestSellingItem({
    Key? key,
    this.networkImgUrl,
    this.productName,
    this.productCategoryName,
    this.productPrice,
    this.isApiDate = false,
    this.onTap,
  }) : super(key: key);
  final bool isApiDate;
  final String? networkImgUrl;
  final String? productName;
  final String? productCategoryName;
  final String? productPrice;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 319.h,
        width: 164.w,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240.h,
              width: 164.w,
              decoration: BoxDecoration(
                image: isApiDate
                    ? DecorationImage(
                        image: NetworkImage(networkImgUrl!),
                        fit: BoxFit.cover,
                      )
                    : const DecorationImage(
                        image: AssetImage(mainPageBestSellingImg),
                        fit: BoxFit.cover,
                      ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            TextMedium16(
              !isApiDate ? "BeoPlay Speaker" : productName!,
              // style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 3.h),
            TextNormal12(
              !isApiDate ? "Bang and Olufsen" : productCategoryName!,
              // style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color: offWhiteAppColor,
              // ),
            ),
            SizedBox(height: 3.h),
            TextMedium16(
              !isApiDate ? "\$755" : productPrice!,
              // style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCardItem extends StatelessWidget {
  const CategoryCardItem({
    Key? key,
    required this.iconPath,
    required this.categoryName, this.onTab,
  }) : super(key: key);

  final String iconPath;
  final String categoryName;
  final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: greyAppColor.withOpacity(0.03),
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(iconPath),
            ),
          ),
          SizedBox(height: 10.h),
          TextNormal12(
            categoryName,
            // style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
