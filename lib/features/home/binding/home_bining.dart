import 'package:get/get.dart';

import '../design/manger/home_page_view_model.dart';
import '../domain/repositories/home_repo.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut(
      () => HomePageViewM(
        Get.find<HomeRepo>(),
      ));
  }
}
