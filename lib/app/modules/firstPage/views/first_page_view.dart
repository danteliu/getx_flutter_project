import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/first_page_controller.dart';

class FirstPageView extends GetView<FirstPageController> {
  const FirstPageView({Key? key}) : super(key: key);

  /// 得到tabs view
  List<Widget> getTabViews() {
    List<Widget> tabs = <Widget>[];
    for (int i = 0; i < controller.list.length; i++) {
      if (i == 0) {
        tabs.add(
          Padding(
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
                          controller.count.toString(),
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
                      controller.increment1();
                      controller.increment();
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
      } else {
        tabs.add(const Icon(Icons.directions_boat));
      }
    }
    return tabs;
  }

  /// 获取tab items
  List<Widget> getTabItems() {
    List<Widget> items = <Widget>[];
    for (int i = 0; i < controller.list.length; i++) {
      items.add(
        SizedBox(
          height: 44,
          child: Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  controller.list[i],
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.list.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Welcome',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(44), //保持和导航栏一样的高度
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorColor: Colors.black,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: getTabItems(),
                onTap: (int i) {
                  // print("$i");
                  // print("$kToolbarHeight");
                },
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: TabBarView(
          children: getTabViews(),
        ),
      ),
    );
  }
}
