import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/baseData.dart';

class LatestViewViewController extends GetxController {
  SettingInfo info = SettingInfo();

  /// 接收返回的数据
  Map datas = {};
  String dddd = "我给你说我的兄弟啊";
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDatas();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getDatas() async {
    var dio = Dio();

    final response = await dio.post('${info.baseUrl}/latest');

    datas = response.data;
    print("打印的内容: ${datas} count:${datas.length}");
    update(["datas"]);
  }

  void increment() => count.value++;
}
