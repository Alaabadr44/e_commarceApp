import 'package:get/get.dart';

import '../design/manger/auth_view_model.dart';
import '../domain/repositories/auth_repo.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthViewModel(
    Get.find<AuthRepo>()
      ),
    );
  }
}
