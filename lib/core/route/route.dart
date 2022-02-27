import 'package:get/get.dart';

import '../../features/Auth/Bindings/auth_bindings.dart';
import '../../features/Auth/design/screens/SignUpScreen/sign_up_screen.dart';
import '../../features/Auth/design/screens/loginScreen/login_screen.dart';
import '../../features/Auth/design/screens/splashScreen/splash_screen.dart';
import '../../features/checkout/design/screens/checkoutScreen/checkout_screen.dart';
import '../../features/home/binding/home_bining.dart';
import '../../features/home/design/screens/mainPage/main_page.dart';

List<GetPage> pageRoute = [
  GetPage(
    name: LoginScreen.routeName,
    binding: AuthBindings(),
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: SignUpScreen.routeName,
    page: () => SignUpScreen(),
    binding: AuthBindings(),
  ),
  GetPage(
    binding: AuthBindings(),
    name: SplashScreen.routeName,
    page: () => const SplashScreen(),
  ),
  GetPage(
    binding: HomeBindings(),
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
  ),
  GetPage(
    // binding: AuthBindings(),
    name: CheckoutOrderScreen.routeName,
    page: () => const CheckoutOrderScreen(),
  ),
];
