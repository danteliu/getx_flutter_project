import 'package:get/get.dart';

import '../controllers/find_controller.dart';

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindController>(
      () => FindController(),
    );
  }
}
