import 'package:get/get.dart';

import '../controllers/latest_view_view_controller.dart';

class LatestViewViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatestViewViewController>(
      () => LatestViewViewController(),
    );
  }
}
