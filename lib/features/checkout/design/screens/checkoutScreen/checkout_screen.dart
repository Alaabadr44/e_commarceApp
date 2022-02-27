import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:steps_indicator/steps_indicator.dart';

import '../../../../../utils/colors.dart';
import '../../../../../utils/text_style.dart';
import '../../../../account/design/screens/ViewOrderItinerary/view_order_itinerary.dart';
import '../../manger/checkout_view_model.dart';
import '../../widgets/buttons.dart';
import '../../widgets/widgets.dart';
import '../CheckoutAddressScreen/checkout_address_screen.dart';
import '../checkoutordersummaryscreen/checkout_order_summary_screen.dart';

class CheckoutOrderScreen extends StatelessWidget {
  const CheckoutOrderScreen({Key? key}) : super(key: key);
  static String routeName = '/CheckoutOrderScreen';

// //? for dots bar
//   int x = 0;

//   changeIndex(int x) {
//     x = x;
//     setState(() {});
//   }

//   increment() {
//     x++;
//     setState(() {});
//   }

// // ? for radio
//   int index = 1;

//   void seeIndex(int? nowIndex) {

//       index = nowIndex!;
//       // print("nowIndex is " + nowIndex.toString());

//   }

  @override
  Widget build(BuildContext context) {
    // const white = Colors.white;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const TextNormal20(
          "Checkout",
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
          children: [
            // CheckoutStatusOptionItem
            GetBuilder<CheckoutViewModel>(
              init: CheckoutViewModel(),
              // initState: (_) {},
              builder: (controller) {
                return CheckoutStatusDotsBar(
                  index: controller.dotsIndex,
                  iShow: (controller.dotsIndex != 2),
                );
              },
            ),
            //Checkout – Delivery
            GetBuilder<CheckoutViewModel>(
              builder: (controller) {
                return Visibility(
                  visible: controller.isShowPage(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 32.h),
                      CheckoutStatusOptionItem(
                        currentIndex: controller.radioIndex,
                        onTab: (x) => controller.changeRadioIndex(x!),
                        deliveryType: "Standard Delivery",
                        deliveredInData:
                            "Order will be delivered between 3 - 5 business days",
                        initIndex: 0,
                      ),
                      SizedBox(height: 38.h),
                      CheckoutStatusOptionItem(
                        currentIndex: controller.radioIndex,
                        onTab: (x) => controller.changeRadioIndex(x!),
                        deliveryType: "Next Day Delivery",
                        deliveredInData:
                            "Place your order before 6pm and your items will be delivered the next day",
                        initIndex: 1,
                      ),
                      SizedBox(height: 38.h),
                      CheckoutStatusOptionItem(
                        deliveryType: "Nominated Delivery",
                        deliveredInData:
                            "Pick a particular date from the calendar and order will be delivered on selected date",
                        currentIndex: controller.radioIndex,
                        onTab: (x) => controller.changeRadioIndex(x!),
                        initIndex: 2,
                      ),
                    ],
                  ),
                );
              },
            ),

            //Checkout – Address
            GetBuilder<CheckoutViewModel>(
              // init: CheckoutViewModel(),
              // initState: (_) {},
              builder: (controller) {
                return CheckoutAddressScreen(isShow: controller.isShowPage(1));
              },
            ),

            //CheckoutOrderSummaryBody
            GetBuilder<CheckoutViewModel>(
              builder: (controller) {
                return CheckoutOrderSummaryBody(
                  isShow: controller.isShowPage(2),
                );
              },
            ),
            const Spacer(),

            GetBuilder<CheckoutViewModel>(
              builder: (controller) {
                return BottomButtonsBar(
                  backPress: () => controller.backDots(),
                  nextPress: () => controller.nextDots(),
                  isBackButton: controller.dotsIndex != 0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutStatusDotsBar extends StatelessWidget {
  const CheckoutStatusDotsBar({
    Key? key,
    required this.index,
    required this.iShow,
  }) : super(key: key);

  final int index;
  final bool iShow;

  @override
  Widget build(BuildContext context) {
    // print(currentIndex.toString());
    return Visibility(
      visible: iShow,
      child: Column(
        children: [
          StepsIndicator(
            selectedStep: index,
            nbSteps: 3,
            doneStepColor: premiumColor,
            doneLineColor: premiumColor,
            undoneLineColor: stepAppColor,
            isHorizontal: true,
            lineLength: 86.w,
            doneStepSize: 30,
            unselectedStepSize: 30,
            selectedStepSize: 30,
            selectedStepBorderSize: 2,
            doneStepWidget: const DoneStepWidget(),
            unselectedStepWidget: const UnselectedStepWidget(),
            selectedStepWidget: const SelectedStepWidget(),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              TextNormal12("Delivery"),
              TextNormal12("Address"),
              TextNormal12("Summer"),
            ],
          )
        ],
      ),
    );
  }
}

class BottomButtonsBar extends StatelessWidget {
  const BottomButtonsBar({
    Key? key,
    required this.isBackButton,
    required this.nextPress,
    required this.backPress,
  }) : super(key: key);
  final bool isBackButton;
  final VoidCallback nextPress;
  final VoidCallback backPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(bottom: 17.h),
      // padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: isBackButton,
            child: BackButtonStyle(
              actionPress: backPress,
              actionWord: "BACK",
            ),
          ),
          CheckoutButton(
            actionPress: nextPress,
            actionWord: "NEXT",
          ),
        ],
      ),
    );
  }
}
