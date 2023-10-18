import 'package:assignment2/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.idController,
            ),
            TextField(
              controller: controller.pwController,
            ),
            ElevatedButton(
                onPressed: () => controller.login(), child: Text("로그인"))
          ],
        ),
      ),
    );
  }
}
