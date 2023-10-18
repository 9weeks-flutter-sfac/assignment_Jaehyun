import 'package:assignment2/controller/auth_controller.dart';
import 'package:assignment2/controller/login_controller.dart';
import 'package:assignment2/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

import 'view/pages/login_page.dart';
import 'view/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(
          () => LoginController(),
        );
        Get.lazyPut(
          () => MainController(),
        );
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => const LoginPage()),
        GetPage(name: MainPage.route, page: () => const MainPage())
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Get.toNamed(LoginPage.route), child: Text("입장"))
        ],
      ),
    ));
  }
}
