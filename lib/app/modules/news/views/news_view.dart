import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'NewsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
