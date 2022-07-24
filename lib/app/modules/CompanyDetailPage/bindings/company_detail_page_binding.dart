import 'package:get/get.dart';
import 'package:getx_flutter_project/app/modules/LatestViewView/controllers/latest_view_view_controller.dart';

import '../controllers/company_detail_page_controller.dart';

class CompanyDetailPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyDetailPageController>(
      () => CompanyDetailPageController(),
    );
  }
}
