import 'package:get/get.dart';

import '../../../../../utils/icons.dart';
import '../../../../auth/design/manger/auth_view_model.dart';
import '../../../../auth/design/screens/loginScreen/login_screen.dart';
import '../../screens/AccountShipping/account_shipping.dart';
import '../../screens/TrackOrder/track_order_screen.dart';
import '../model/account_options_model.dart';

class AccountViewModel extends GetxController {
  List<AccountOptionModel> accountOptions = [
    AccountOptionModel(
        iconPath: editProfileAccIcon,
        optionWord: "Edit Profile",
        optionPress: () {}),
    AccountOptionModel(
        iconPath: shippingAddressAccIcon,
        optionWord: "Shipping Address",
        optionPress: () {
          Get.to(() => const AccountShipping());
        }),
    AccountOptionModel(
        iconPath: orderHistoryAccIcon,
        optionWord: "Order History",
        optionPress: () {
          Get.to(
            () => const TrackOrderScreen(),
          );
        }),
    AccountOptionModel(
        iconPath: cardsAccIcon, optionWord: "Cards", optionPress: () {}),
    AccountOptionModel(
        iconPath: notificationsAccIcon,
        optionWord: "Notifications",
        optionPress: () {}),
    AccountOptionModel(
        iconPath: logOutAccIcon,
        optionWord: "Log Out",
        optionPress: () async {
          await Get.find<AuthViewModel>().signOut();
          Get.offAllNamed(LoginScreen.routeName);
        }),
  ];

  bool isShow = true;

  void onTab() {
    isShow = !isShow;
    update();
  }
}
