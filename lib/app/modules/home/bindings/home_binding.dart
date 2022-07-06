import 'package:get/get.dart';

import '../../firstPage/controllers/first_page_controller.dart';
import '../../mine/controllers/mine_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FirstPageController>(
      () => FirstPageController(),
    );
    Get.lazyPut<MineController>(
      () => MineController(),
    );
  }
}
