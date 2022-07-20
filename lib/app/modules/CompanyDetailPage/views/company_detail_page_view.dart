import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/company_detail_page_controller.dart';

class CompanyDetailPageView extends GetView<CompanyDetailPageController> {
  CompanyDetailPageView({Key? key}) : super(key: key);
  Map lastSource = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //修改颜色
        ),
        title: Text(
          lastSource["mechanismName"],
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: PageView(
        controller: controller.p,
        onPageChanged: (int num) {
          print("滑动到第$num个");
        },
        children: [
          Text(
            lastSource["mechanismName"],
            style: const TextStyle(fontSize: 20),
          ),
          const Text(
            "2",
            style: TextStyle(fontSize: 20),
          ),
          InkWell(
            onTap: controller.gotoSecond,
            child: const Text(
              "点击跳转到2",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
