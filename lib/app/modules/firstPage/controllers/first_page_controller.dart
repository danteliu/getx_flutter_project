import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:getx_flutter_project/app/data/baseData.dart';

class FirstPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  SettingInfo info = SettingInfo();
  //TODO: Implement FirstPageController
  late TabController tabController;
  final count = 0.obs;
  int count1 = 10;
  var list = [
    "你好",
    "我好",
    "大家好",
    "随机",
    "我的大哥",
    "大兄弟",
    "你好",
    "这是我的",
    "你好啊",
    "梦醒",
    "无所谓",
    "一切"
  ];
  List datas = [];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: list.length, vsync: this);

    tabController.addListener(() {
      if (tabController.index == tabController.animation?.value) {
        print(
            "onClick 第${tabController.index}个,是 ${list[tabController.index]}");
      }
    });
    getDatas();
  }

  void getDatas() async {
    var dio = Dio();

    final response = await dio.post('${info.baseUrl}/newInfoList');

    datas = response.data["lists"];
    // print("打印的内容: ${datas} count:${datas.length}");
    update(["datasUpdate"]);
    print("count:${datas.length}");
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
  void increment1() {
    count1++;
    update(["mys"]);
  }
}
