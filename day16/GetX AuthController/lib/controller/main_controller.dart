import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class MainController extends GetxController {
  var pageController = PageController();

  RxInt curPage = 0.obs;

  onPageTapped(int value) {
    pageController.jumpToPage(value);
    curPage.value = value;
  }
}
