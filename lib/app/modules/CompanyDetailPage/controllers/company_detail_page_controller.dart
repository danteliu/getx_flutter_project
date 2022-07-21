import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyDetailPageController extends GetxController {
  //TODO: Implement CompanyDetailPageController
  late PageController p;
  final count = 0.obs;

  int currentIndex = 0;
  List topTitles = [
    "Latest",
    "World",
    "Business",
    "Sports",
    "Lifestyle",
  ];

  @override
  void onInit() {
    super.onInit();
    p = PageController(
      initialPage: 0,
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

  /// 跳转到对应的pageindex页面
  jumpToPage(int pageIndex) {
    p.jumpToPage(pageIndex);
  }

  changeCurrentIndex(int index) {
    currentIndex = index;
    update(["updatetitle"]);
  }
}
