import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_flutter_project/app/modules/firstPage/controllers/first_page_controller.dart';

class MsgShwoViewView extends GetView {
  const MsgShwoViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 10,
      ),
      itemCount: 100,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print("点击了 $index cell");
          },
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
            ),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
              child: Center(
                child: Text("这是第$index个"),
              ),
            ),
          ),
        );
      },
    );
  }
}
