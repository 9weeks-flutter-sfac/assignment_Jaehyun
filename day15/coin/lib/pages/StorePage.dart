import 'package:assignment2/controller/CoinController.dart';
import 'package:assignment2/controller/global_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CoinController>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Obx(
            () => Text("현재 보유한 코인 ${controller.coin.value.toString()}"),
          )),
          ElevatedButton(
              onPressed: () {
                controller.coin.value = 0;
              },
              child: Text("코인 리셋")),
        ],
      ),
    );
  }
}
