import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyDetailPageController extends GetxController {
  /// 控制pageview的控制器
  late PageController p;
  final count = 0.obs;

  /// 控制详情pageview 和titleview 的位置
  int currentIndex = 0;

  /// 详情需要显示的title数组
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
