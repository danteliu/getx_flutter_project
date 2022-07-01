import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_flutter_project/app/modules/find/views/find_view.dart';
import 'package:getx_flutter_project/app/modules/firstPage/views/first_page_view.dart';
import 'package:getx_flutter_project/app/modules/mine/views/mine_view.dart';
import 'package:getx_flutter_project/app/modules/news/views/news_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  getNames(int index) {
    return <String>[
      "首页",
      "发现",
      "新闻",
      "我的",
    ][index];
  }

  Widget getPages(int onClickIndex) {
    debugPrint("我是谁:${getNames(onClickIndex)}");
    return [
      const FirstPageView(),
      const FindView(),
      const NewsView(),
      const MineView(),
    ][onClickIndex];
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) {
        return Scaffold(
          body: getPages(controller.tabarIndex),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: const Color.fromARGB(255, 71, 5, 5),
            onTap: c.changeTabIndex,
            currentIndex: c.tabarIndex,
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            // type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home,
                ),
                label: getNames(0),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.find_in_page,
                ),
                label: getNames(1),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.new_label_sharp,
                ),
                label: getNames(2),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.account_circle_outlined,
                ),
                label: getNames(3),
              ),
            ],
          ),
        );
      },
    );
  }
}
