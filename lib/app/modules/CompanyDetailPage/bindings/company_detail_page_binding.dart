import 'package:get/get.dart';

import '../controllers/company_detail_page_controller.dart';

class CompanyDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyDetailPageController>(
      () => CompanyDetailPageController(),
    );
  }
}
