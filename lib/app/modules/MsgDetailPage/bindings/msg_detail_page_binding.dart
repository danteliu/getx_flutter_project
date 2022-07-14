import 'package:get/get.dart';

import '../controllers/msg_detail_page_controller.dart';

class MsgDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MsgDetailPageController>(
      () => MsgDetailPageController(),
    );
  }
}
