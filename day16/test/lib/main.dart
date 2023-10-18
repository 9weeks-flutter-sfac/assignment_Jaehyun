import 'package:assignment2/pages/HomePage.dart';
import 'package:assignment2/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';
import 'util/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: HomePage.route,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
        Get.put(HomeController());
      }),
    );
  }
}

class MyHomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(AppRoutes.home);
          },
          child: Text("버튼"),
        ),
      ),
    );
  }
}
