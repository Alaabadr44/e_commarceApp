import 'package:get/get.dart';

import '../../features/Auth/data/repositories/auth_repo_imp.dart';
import '../../features/Auth/domain/repositories/auth_repo.dart';
import '../../features/home/data/repositories/home_repo_imp.dart';
import '../../features/home/domain/repositories/home_repo.dart';

// repo injection for Apps
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthRepo>(AuthRepoImp());
    Get.put<HomeRepo>(HomeRepoImpl());
    // Get.lazyPut(
    //   () => AuthViewModel(
    //     Get.find<AuthRepoImp>(),
    //   ));
   
  }
}
