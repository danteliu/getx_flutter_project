import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/latest_view_view_controller.dart';

class LatestViewViewView extends GetView<LatestViewViewController> {
  @override
  LatestViewViewController controller = Get.put(LatestViewViewController());

  LatestViewViewView({
    Key? key,
  }) : super(key: key);

  Map getNextPageModel(element) {
    return {
      "name": element["title"],
      "imgUrl": element["image"],
      "description": element["des"],
    };
  }

  List<Widget> getCells() {
    List<Widget> cells = [];
    if (controller.datas.isEmpty) {
      return cells;
    }
    List latests = controller.datas["latest"];

    for (Map element in latests) {
      if (element["style"] == "top") {
        cells.add(
          InkWell(
            onTap: () {
              Get.toNamed(
                Routes.MSG_DETAIL_PAGE,
                arguments: getNextPageModel(element),
              );
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CachedNetworkImage(
                        imageUrl: element["image"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          element["des"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text(element["extension"]),
                        const Text(" · "),
                        Text(element["time"]),
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            child: const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.more_horiz),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0.4,
                    color: Colors.black12,
                  ),
                ],
              ),
            ),
          ),
        );
        // cells.add(const Text("nihk"));
      } else {
        print(element);
        cells.add(
          InkWell(
            onTap: () {
              Get.toNamed(
                Routes.MSG_DETAIL_PAGE,
                arguments: getNextPageModel(element),
              );
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(
                top: 8,
                left: 8,
                right: 8,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: AspectRatio(
                            aspectRatio: 9 / 7,
                            child: CachedNetworkImage(
                              imageUrl: element["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      element["des"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 13,
                                        height: 1.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(element["extension"]),
                                    const Text(" · "),
                                    Text(
                                      formatDate(
                                        DateTime.parse(element["time"]),
                                        [HH, ':', mm, ":", ss],
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Get.bottomSheet(
                                            Container(
                                              color: Colors.white,
                                              height: double.infinity,
                                              width: double.infinity,
                                              child: Stack(
                                                children: const [
                                                  Positioned(
                                                    left: 20,
                                                    top: 50,
                                                    child: Text(
                                                      "data",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Align(
                                          alignment: Alignment.bottomRight,
                                          child: Icon(Icons.more_horiz),
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   child: Align(
                                    //     alignment: Alignment.bottomRight,
                                    //     child: PopupMenuButton<String>(
                                    //       position: PopupMenuPosition.under,
                                    //       padding: const EdgeInsets.all(0),
                                    //       child: const Icon(Icons.more_horiz),
                                    //       itemBuilder: (context) {
                                    //         return const <
                                    //             PopupMenuEntry<String>>[
                                    //           PopupMenuItem<String>(
                                    //             value: '语文',
                                    //             child: Text('语文'),
                                    //           ),
                                    //           PopupMenuItem<String>(
                                    //             value: '数学',
                                    //             child: Text('数学'),
                                    //           ),
                                    //         ];
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Offstage(
                    offstage: element == latests.last ? true : false,
                    child: const Divider(
                      height: 0.4,
                      color: Colors.black12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LatestViewViewController>(
      id: "datas",
      builder: (e) {
        return ListView(
          children: getCells(),
        );
      },
    );
  }
}
