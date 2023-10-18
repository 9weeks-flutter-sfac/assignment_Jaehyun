import 'package:assignment2/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends GetView<AuthController> {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("${controller.user!.username} 님 안녕하세요"),
      ],
    );
  }
}
