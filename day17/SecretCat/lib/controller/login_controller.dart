import 'package:assignment2/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final idController = TextEditingController(text: "testjaehyun180@naver.com");
  final pwController = TextEditingController(text: "testjaehyun");

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }
}
