import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text_style.dart';

class CategoryResultScreen extends StatelessWidget {
  const CategoryResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const TextNormal20(
          "Men",
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: black,
            size: 20.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15.w,
            mainAxisExtent: 339.h,
            mainAxisSpacing: 16.h,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return CategoryResultScreenItem(
              isApi: false,
              isNew: index % 2 == 0,
            );
          },
        ),
      ),
    );
  }
}

class CategoryResultScreenItem extends StatelessWidget {
  const CategoryResultScreenItem({
    Key? key,
    required this.isApi,
    this.onTap,
    required this.isNew,
    this.imageUrl,
    this.productName,
    this.productCategory,
    this.productPrice,
  }) : super(key: key);

  final bool isApi;
  final VoidCallback? onTap;
  final bool isNew;
  final String? imageUrl;
  final String? productName;
  final String? productCategory;
  final int? productPrice;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        height: 339.h,
        width: 164.w,
        color: white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Container(
                  height: 260.h,
                  width: 164.w,
                  decoration: BoxDecoration(
                    image: isApi
                        ? DecorationImage(
                            image: NetworkImage(imageUrl!),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: AssetImage(mainPageBestSellingImg),
                            fit: BoxFit.cover,
                          ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.r),
                    ),
                  ),
                ),
                Visibility(
                  visible: isNew,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Container(
                      height: 24.h,
                      width: 49.w,
                      child: const Center(
                        child: TextNormal12(
                          "New",
                          color: Colors.white,
                          // fontSize: 12.sp,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: redAppColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            TextMedium16(
              productName ?? "BeoPlay Speaker",
              // textColor: Colors.black,
              // fontSize: 16.sp,
              // fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 2.h),
            TextNormal12(
              productCategory ?? "Bang and Olufsen",
              color: offWhiteAppColor,
              // fontSize: 12.sp,
            ),
            SizedBox(height: 10.h),
            TextMedium16(
              productPrice != null ? ("\$" + productPrice.toString()) : "\$755",
              color: premiumColor,
              // fontSize: 16.sp,
              // fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
