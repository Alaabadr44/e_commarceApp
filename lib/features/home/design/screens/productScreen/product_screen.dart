import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/images.dart';
import '../../../../../utils/text_style.dart';
import '../../../../../widgets/bars.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 245, 245),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImgBackStarButtonBar(isApiData: false, backPress: () => Get.back()),
          SizedBox(height: 4.2.h),
          const ProductNameBar(productName: "Nike Dri-FIT Long Sleeve"),
          SizedBox(height: 25.1.h),
          const ProductScreenPropertiesBar(),
          const DetailsBar(),
          const Spacer(),
          const Divider(),
          AddToCartBar(
            priceWord: "PRICE",
            price: 1500,
            actionWord: "ADD",
            actionPress: () {},
          )
        ],
      ),
    );
  }
}

class DetailsBar extends StatelessWidget {
  const DetailsBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 33.h,
            bottom: 15.3.h,
            start: 16.w,
          ),
          child: const TextBold18(
            "Details",
          ),
        ),
        SizedBox(
          height: 240.h,
          width: 343.w,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Text(
              "Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.\n Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.\n Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.",
              style: GoogleFonts.montserrat().copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                overflow: TextOverflow.clip,
                // wordSpacing: 5,
                height: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductScreenPropertiesBar extends StatelessWidget {
  const ProductScreenPropertiesBar({
    Key? key,
    this.sizePress,
    this.colorPress,
  }) : super(key: key);

  final VoidCallback? sizePress;
  final VoidCallback? colorPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProductScreenPropertiesItem(
            onTab: sizePress ?? () {},
            propertyName: "Size",
            propertyWidget: const TextBold14(
              "XL",
            ),
          ),
          const Spacer(),
          ProductScreenPropertiesItem(
            onTab: colorPress ?? () {},
            propertyName: "Color",
            propertyWidget: Container(
              height: 22.h,
              width: 22.w,
              decoration: BoxDecoration(
                color: const Color(0xff31407B),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductNameBar extends StatelessWidget {
  const ProductNameBar({
    Key? key,
    required this.productName,
  }) : super(key: key);
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 18.w),
      child: TextBold26(
        productName,
      ),
    );
  }
}

class ImgBackStarButtonBar extends StatelessWidget {
  const ImgBackStarButtonBar({
    Key? key,
    required this.isApiData,
    this.imageSrc,
    this.backPress,
    this.starPress,
  }) : super(key: key);

  final bool isApiData;
  final String? imageSrc;
  final VoidCallback? backPress;
  final VoidCallback? starPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxHeight,
            height: 206.h,
            child: isApiData
                ? Image.network(imageSrc!, fit: BoxFit.fill)
                : Image.asset(
                    productScreenSimpleImg,
                    fit: BoxFit.fill,
                  ),
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: backPress ?? () {},
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 19.sp,
              ),
            ),
            InkWell(
              onTap: starPress ?? () {},
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 27.w),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20.r,
                  child: const Center(
                    child: Icon(
                      Icons.star_border,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

class ProductScreenPropertiesItem extends StatelessWidget {
  const ProductScreenPropertiesItem({
    Key? key,
    required this.propertyName,
    required this.propertyWidget,
    required this.onTab,
  }) : super(key: key);
  final String propertyName;
  final Widget propertyWidget;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 40.h,
        width: 160.w,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(
            color: const Color(0xffEBEBEB),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextNormal14(
              propertyName,
            ),
            const Spacer(),
            propertyWidget
          ],
        ),
      ),
    );
  }
}
