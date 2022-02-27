import 'package:get/get.dart';

class CheckoutViewModel extends GetxController {
  int radioIndex = 0;

  void changeRadioIndex(int index) {
    radioIndex = index;
    update();
  }

  int dotsIndex = 0;

  void nextDots() {
    if (0 <= dotsIndex && dotsIndex < 2) {
      dotsIndex++;
    }
    update();

    // if (dotsIndex >= 2) {}
  }

  void backDots() {
    if (0 < dotsIndex && dotsIndex <= 2) {
      //dotsIndex <= 2
      dotsIndex--;
    }
    update();
  }

  bool isShowPage(int index) {
    return index == dotsIndex;
  }
}
