import 'package:assignment2/controller/auth_controller.dart';
import 'package:assignment2/widgets/user_Page.dart';
import 'package:assignment2/widgets/user_tail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/main_controller.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            currentIndex: controller.curPage.value,
            onTap: controller.onPageTapped,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"),
            ]),
      ),
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          children: [
            UserPage(),
            UserTail(),
          ],
        ),
      ),
    );
  }
}
