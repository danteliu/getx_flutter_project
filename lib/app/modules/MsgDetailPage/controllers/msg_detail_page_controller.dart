import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_flutter_project/app/data/baseData.dart';

class MsgDetailPageController extends GetxController {
  //TODO: Implement MsgDetailPageController
  SettingInfo info = SettingInfo();
  String article = "";
  final count = 0.obs;
  List tags = [];
  @override
  void onInit() {
    super.onInit();
    print("信息详情");
    getDatas();
  }

  void getDatas() async {
    var dio = Dio();

    final response = await dio.post('${info.baseUrl}/msgDetail');
    article = response.data["article"];
    tags = response.data["tags"];
    update(["article"]);
    update(["tags"]);
    // datas = response.data["lists"];
    // // print("打印的内容: ${datas} count:${datas.length}");
    // update(["datasUpdate"]);
    // print("count:${datas.length}");
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
}
