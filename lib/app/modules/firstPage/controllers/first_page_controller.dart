import 'package:get/get.dart';
import 'package:dio/dio.dart';

class FirstPageController extends GetxController {
  //TODO: Implement FirstPageController

  final count = 0.obs;
  int count1 = 10;
  var list = ["你好"];

  @override
  void onInit() {
    getDatas();
    super.onInit();
  }

  void getDatas() async {
    var dio = Dio();
    final response = await dio.post(
        'https://www.fastmock.site/mock/81e82bca25efe9ef25af1fe9b1c36a0d/wjmfmiyk/demo');
    print("打印:${response.data}");
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
