import 'package:e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:steps_indicator/steps_indicator.dart';
import '../../../../../utils/text_style.dart';

class ViewOrderItinerary extends StatelessWidget {
  const ViewOrderItinerary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const TextNormal20(
          "OD - 424923192 - N",
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
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.w),
            child: SizedBox(
              height: 40.h,
              width: 40.w,
              child: CircleAvatar(
                backgroundColor: premiumColor,
                child: Center(
                  child: SvgPicture.asset(
                    shippingAddressAccIcon,
                    color: white,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 33.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //1
                    const DateAndTImeTrackWidget(),
                    SizedBox(height: 86.h),
                    //2
                    const DateAndTImeTrackWidget(), SizedBox(height: 86.h),
                    //3
                    const DateAndTImeTrackWidget(),
                    // SizedBox(height: 86.h),
                    // const DateAndTImeTrackWidget()
                  ],
                ),
                SizedBox(width: 30.w),
                const VerticalStepsIndicatorsBars(),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const OrderStatusAndPlaceTrackWidget(
                        statusName: "Order Signed"),
                    SizedBox(height: 80.h),
                    const OrderStatusAndPlaceTrackWidget(
                        statusName: "Order Processed"),
                    SizedBox(height: 80.h),
                    const OrderStatusAndPlaceTrackWidget(statusName: "Shipped"),
                    SizedBox(height: 80.h),
                    const OrderStatusAndPlaceTrackWidget(
                        statusName: "Out for delivery"),
                    SizedBox(height: 80.h),
                    const OrderStatusAndPlaceTrackWidget(
                        statusName: "Delivered"),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VerticalStepsIndicatorsBars extends StatelessWidget {
  const VerticalStepsIndicatorsBars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StepsIndicator(
      selectedStep: 2,
      nbSteps: 5,
      // selectedStepColorOut: Colors.red,
      // selectedStepColorIn: Colors.white,
      doneStepColor: premiumColor,
      doneLineColor: premiumColor,
      undoneLineColor: stepAppColor,
      isHorizontal: false,
      lineLength: 86.w,
      doneStepSize: 30,
      unselectedStepSize: 30,
      selectedStepSize: 30,
      selectedStepBorderSize: 2,
      doneStepWidget: const DoneStepWidget(), // Custom Widget
      unselectedStepWidget:
          const UnselectedStepWidget(), // Custom Widget
      selectedStepWidget:
          const SelectedStepWidget(), // Custom Widget
      // lineLengthCustomStep: [
      //   StepsIndicatorCustomLine(nbStep: 3, length: 10)
      // ],
      // enableLineAnimation: false,
      // enableStepAnimation: false,
    );
  }
}

class OrderStatusAndPlaceTrackWidget extends StatelessWidget {
  const OrderStatusAndPlaceTrackWidget({
    this.isApi = false,
    Key? key,
    required this.statusName,
    this.placeName,
  }) : super(key: key);

  final bool isApi;
  final String? statusName;
  final String? placeName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43.h,
      width: 105.w,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextMedium16(statusName == null ? "Order Signed" : statusName!),
            SizedBox(height: 4.h),
            TextNormal12(!isApi ? "Lagos State, Nigeria" : placeName!)
          ],
        ),
      ),
    );
  }
}

class DateAndTImeTrackWidget extends StatelessWidget {
  const DateAndTImeTrackWidget({
    Key? key,
    this.isApi = false,
    this.data,
    this.time,
  }) : super(key: key);

  final bool isApi;
  final String? data;
  final String? time;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 42.w,
      height: 37.h,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextNormal12(!isApi ? "20/18" : data!),
            SizedBox(height: 6.h),
            TextNormal10(!isApi ? "10:00 AM" : time!)
          ],
        ),
      ),
    );
  }
}

class SelectedStepWidget extends StatelessWidget {
  const SelectedStepWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.w,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: white,
        shape: BoxShape.circle,
        border: Border.all(
          color: premiumColor,
          width: 2,
        ),
      ),
      child: const CircleAvatar(
        backgroundColor: premiumColor,
      ),
    );
  }
}

class UnselectedStepWidget extends StatelessWidget {
  const UnselectedStepWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.w,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: white,
        shape: BoxShape.circle,
        border: Border.all(
          color: stepAppColor,
          width: 2,
        ),
      ),
    );
  }
}

class DoneStepWidget extends StatelessWidget {
  const DoneStepWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 30.w,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: white,
        shape: BoxShape.circle,
        border: Border.all(
          color: stepAppColor,
          width: 2,
        ),
      ),
      child: const CircleAvatar(
        backgroundColor: premiumColor,
      ),
    );
  }
}
