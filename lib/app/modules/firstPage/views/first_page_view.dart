import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/first_page_controller.dart';

class FirstPageView extends GetView<FirstPageController> {
  const FirstPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstPageView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: const [
          Text(
            'FirstPageView is working',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'FirstPageView is working2',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'FirstPageView is working3',
            style: TextStyle(fontSize: 20),
          ),
        ],
      )),
    );
  }
}
