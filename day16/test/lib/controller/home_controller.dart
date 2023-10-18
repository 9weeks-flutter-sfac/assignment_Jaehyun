import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/routes.dart';

// 홈에서 사용할수있는 컨트롤러 
class HomeController extends GetxController {
  var textController = TextEditingController();

  RxString text = "".obs;

  toHome() {
    Get.toNamed(AppRoutes.home);
  }

  void updateText(String newText) {
    text.value = newText;
  }
}
