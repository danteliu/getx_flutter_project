import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/first_page_controller.dart';

class FirstPageView extends GetView<FirstPageController> {
  const FirstPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print("FirstPageController:$controller");
    FirstPageController fCtrl = Get.put(FirstPageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstPageView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 0,
          bottom: 0,
          left: 10,
          right: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                (() => Text(
                      fCtrl.count.toString(),
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
              const SizedBox(height: 10),
              GetBuilder<FirstPageController>(
                id: "mys",
                builder: (e) {
                  return Text(e.count1.toString());
                },
              ),
              ElevatedButton(
                onPressed: () {
                  fCtrl.increment1();
                  fCtrl.increment();
                },
                child: const Text("add counter"),
              ),
              const Text(
                'FirstPageView is working2',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              const Text(
                'FirstPageView is working3',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
