import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  int count = 0;
  int tabarIndex = 0;

  addValue() {
    count += 1;
    update();
  }

  /// 修改tabar的index
  void changeTabIndex(int index) {
    tabarIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
