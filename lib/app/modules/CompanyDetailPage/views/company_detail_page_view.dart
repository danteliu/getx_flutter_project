import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:getx_flutter_project/app/modules/LatestViewView/views/latest_view_view_view.dart';

import '../controllers/company_detail_page_controller.dart';

class CompanyDetailPageView extends GetView<CompanyDetailPageController> {
  CompanyDetailPageView({Key? key}) : super(key: key);
  Map lastSource = Get.arguments;
  List<Widget> getTopViews() {
    List<Widget> tmp = [];

    for (String element in controller.topTitles) {
      // currentIndex
      int index = controller.topTitles.indexOf(element);

      tmp.add(
        InkWell(
          onTap: () {
            print("点击了$element");
            controller.currentIndex = index;
            controller.jumpToPage(index);
          },
          child: Container(
            height: 44,
            color: index == controller.currentIndex
                ? const Color.fromRGBO(0, 47, 167, 1)
                : Colors.white,
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 0,
              left: 20,
              right: 20,
            ),
            child: Center(
              child: Text(
                element,
                style: TextStyle(
                  color: index == controller.currentIndex
                      ? Colors.white
                      : Colors.black,
                  fontWeight: index == controller.currentIndex
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return tmp;
  }

  ///获取显示的pageViews
  List<Widget> getPageViews() {
    List<Widget> tmp = [];

    for (String element in controller.topTitles) {
      // currentIndex
      // int index = controller.topTitles.indexOf(element);
      if (element == "Latest") {
        tmp.add(LatestViewViewView());
      } else {
        tmp.add(
          Center(
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(5),
              child: Text(element),
            ),
          ),
        );
      }
    }
    return tmp;
  }

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

      ///使用Sliver实现
      // body: CustomScrollView(
      //   slivers: <Widget>[
      //     SliverFixedExtentList(
      //       itemExtent: 100,
      //       delegate: SliverChildListDelegate([
      //         Container(
      //           color: Colors.green,
      //         ),
      //       ]),
      //     ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //         childCount: 10,
      //         (context, index) => Padding(
      //           padding: const EdgeInsets.all(30),
      //           child: Text("第 $index 行"),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      /// 使用listview 嵌套pageView实现 通过LayoutBuilder获取sizebox的高度
      body: SizedBox.expand(
        child: LayoutBuilder(
          builder: (context, c) {
            return ListView(
              children: [
                SizedBox(
                  // width: double.infinity,
                  height: c.maxHeight,
                  child: Column(
                    children: [
                      // const Text("这是我的"),
                      SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(2.0, 3.0), //阴影x轴偏移量
                                    blurRadius: 5, //阴影模糊程度
                                    spreadRadius: 0, //阴影扩散程度
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: CachedNetworkImage(
                                  imageUrl: lastSource["mechanismImageUrl"],
                                  fit: BoxFit.cover,
                                  width: 46,
                                  height: 46,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              lastSource["mechanismName"],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        // height: 44,
                        child: GetBuilder<CompanyDetailPageController>(
                          id: "updatetitle",
                          builder: (context) {
                            return SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: getTopViews(),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          controller: controller.p,
                          onPageChanged: (int num) {
                            print("滑动到第$num个");
                            controller.changeCurrentIndex(num);
                          },
                          children: getPageViews(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),

      ///pageView嵌套listView实现
      // body: Column(
      //   children: [
      //     const Text("你好是"),
      //     Expanded(
      //       child: PageView(
      //         children: [
      //           Container(
      //             color: Colors.green,
      //             child: ListView(
      //               children: const [
      //                 Text("11"),
      //               ],
      //             ),
      //           ),
      //           ListView(
      //             children: const [
      //               Text("2"),
      //             ],
      //           ),
      //           ListView(
      //             children: const [
      //               Text("3"),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
