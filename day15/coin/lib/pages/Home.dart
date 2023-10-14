// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:assignment2/controller/global_data.dart';
import 'package:assignment2/pages/StorePage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../controller/CoinController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CoinController());
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text("현재 코인 갯수 ${controller.coin.value.toString()}"),
          ),
          Icon(
            FontAwesomeIcons.bitcoin,
            size: 96.0,
            color: Colors.yellow.shade700,
          ),
          TextButton(
              onPressed: () {
                Get.to(() => StorePage());
              },
              child: Text("상점으로 이동하기")),
        ],
      )),
    );
  }
}
