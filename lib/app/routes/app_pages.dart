import 'package:get/get.dart';

import '../modules/MsgDetailPage/bindings/msg_detail_page_binding.dart';
import '../modules/MsgDetailPage/views/msg_detail_page_view.dart';
import '../modules/find/bindings/find_binding.dart';
import '../modules/find/views/find_view.dart';
import '../modules/firstPage/bindings/first_page_binding.dart';
import '../modules/firstPage/views/first_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mine/bindings/mine_binding.dart';
import '../modules/mine/views/mine_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MINE,
      page: () => const MineView(),
      binding: MineBinding(),
    ),
    GetPage(
      name: _Paths.FIRST_PAGE,
      page: () => FirstPageView(),
      binding: FirstPageBinding(),
    ),
    GetPage(
      name: _Paths.FIND,
      page: () => const FindView(),
      binding: FindBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.MSG_DETAIL_PAGE,
      page: () => MsgDetailPageView(),
      binding: MsgDetailPageBinding(),
    ),
  ];
}
