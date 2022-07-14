import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/msg_detail_page_controller.dart';

class MsgDetailPageView extends GetView<MsgDetailPageController> {
  MsgDetailPageView({
    Key? key,
  }) : super(key: key);
  var datas = Get.arguments;
  List<Widget> getTagsView() {
    List<Widget> tags = [];
    for (var tag in controller.tags) {
      tags.add(
        Padding(
          padding: EdgeInsets.only(
            right: tag == controller.tags.last ? 0 : 10,
          ),
          child: Container(
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 15,
              right: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(tag),
          ),
        ),
      );
    }
    // for (var i = 0; i < controller.tags.length; i++) {}

    return tags;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //修改颜色
        ),
        title: Text(
          datas["name"],
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
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Image.network(
                      datas["imgUrl"],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(datas["description"].toString(),
                          style: const TextStyle(
                            height: 1.5,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.black87,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),
                  // decoration: const BoxDecoration(
                  //   color: Colors.red,
                  // ),
                  child: Row(
                    children: [
                      Row(
                        children: const [
                          Text("类别"),
                          Text(" · "),
                          Text("时间"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: GetBuilder<MsgDetailPageController>(
                    id: "tags",
                    builder: (e) {
                      return Row(
                        children: getTagsView(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                GetBuilder<MsgDetailPageController>(
                  id: "article",
                  builder: (e) {
                    return Text(
                      e.article,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 2,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
