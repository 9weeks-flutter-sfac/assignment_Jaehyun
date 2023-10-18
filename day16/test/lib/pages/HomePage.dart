import 'package:assignment2/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(controller: controller.textController),
          TextButton(
              onPressed: () {
                print(controller.textController.value);
              },
              child: Text("눌러줘")),
        ],
      ),
    ));
  }
}
