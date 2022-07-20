import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyDetailPageController extends GetxController {
  //TODO: Implement CompanyDetailPageController
  late PageController p;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    p = PageController(
      initialPage: 1,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  gotoSecond() {
    p.animateToPage(
      1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  jumpToPage() {
    p.jumpToPage(1);
  }
}
