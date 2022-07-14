import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'package:get/get.dart';
import 'package:getx_flutter_project/app/modules/firstPage/controllers/first_page_controller.dart';

class MsgShwoViewView extends GetView {
  MsgShwoViewView({Key? key}) : super(key: key);
  FirstPageController fctrl = Get.find();
  Widget getCells(int index) {
    Map obj = fctrl.datas[index];
    String style = obj["style"];
    print("${obj["description"]}");
    if (style == "01") {
      return MsgStyleFirst(
        obj: obj,
        onClick: () {
          print("${obj["imgUrl"]}");
        },
      );
    } else if (style == "02") {
      return MsgStyleSecond(
        obj: obj,
        onClick: () {
          print("${obj["imgUrl"]}");
        },
      );
    } else if (style == "03") {
      return MsgStyleThree(
        obj: obj,
        onClick: () {
          print("${obj["imgUrl"]}");
        },
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
          ),
          width: double.infinity,
          height: 44,
          child: const Center(child: Text("样式异常")),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      onRefresh: () async {
        fctrl.getDatas();
      },
      onLoad: () async {
        print('加载');
      },
      header: ClassicalHeader(
        refreshText: "下拉刷新",
        refreshReadyText: "松开后开始刷新",
        refreshingText: "正在刷新...",
        refreshedText: "刷新完成",
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        infoText: '更新于 %T',
      ),
      footer: ClassicalFooter(
        loadText: "上拉加载更多",
        loadReadyText: "松开后开始加载",
        loadingText: "正在加载...",
        loadedText: "加载完成",
        noMoreText: "没有更多内容了",
        bgColor: Colors.transparent,
        textColor: Colors.black87,
        infoText: '更新于 %T',
      ),
      child: GetBuilder<FirstPageController>(
        id: "datasUpdate",
        builder: (controller) => ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          itemCount: controller.datas.length,
          itemBuilder: (context, index) {
            return getCells(index);
          },
        ),
      ),
    );
  }
}

class MsgStyleFirst extends GetView {
  final Map obj;
  final GestureTapCallback? onClick;

  const MsgStyleFirst({
    Key? key,
    required this.obj,
    this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          // ElevatedButton(onPressed: onPressed, child: child)
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 5,
              child: Image.network(
                obj["imgUrl"],
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(obj["name"]),
            ],
          ),
          const SizedBox(width: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: Text(
              obj["description"],
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                height: 1.5,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Row(
                  children: const [
                    Text("类别"),
                    Text(" · "),
                    Text("时间"),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.more_horiz_outlined),
                    SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class MsgStyleSecond extends GetView {
  final Map obj;
  final GestureTapCallback? onClick;

  const MsgStyleSecond({
    Key? key,
    required this.obj,
    this.onClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        height: 120,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    obj["imgUrl"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(obj["name"]),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            obj["description"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis, //设置文字省略模式
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              height: 1.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Row(
                              children: const [
                                Text("类别"),
                                Text(" · "),
                                Text("时间"),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Icon(Icons.more_horiz_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MsgStyleThree extends GetView {
  final Map obj;
  final GestureTapCallback? onClick;

  const MsgStyleThree({
    Key? key,
    required this.obj,
    this.onClick,
  }) : super(key: key);

  List<Widget> getViews() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.red,
            )),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: getViews(),
        ),
      ),
    );
  }
}
