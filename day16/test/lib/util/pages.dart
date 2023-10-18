import 'package:assignment2/controller/home_controller.dart';
import 'package:assignment2/util/routes.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import '../pages/HomePage.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.home,
        page: () => HomePage(),
        binding: BindingsBuilder(
          () {
            Get.put(HomeController());
          },
        )),
  ];
}
