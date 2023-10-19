// ignore_for_file: unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment2/controller/auth_controller.dart';
import 'package:assignment2/controller/upload_controller.dart';
import 'package:assignment2/widgets/custon_textFiled.dart';
import 'package:assignment2/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var bgImgUrl =
    "https://images.unsplash.com/photo-1663465376645-aca0b7c8227a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80";

class UploadPage extends GetView<UploadController> {
  const UploadPage({super.key});
  static const String route = '/upload';

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: NetworkImage(bgImgUrl),
                colorFilter:
                    ColorFilter.mode(Colors.black54, BlendMode.darken)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${authController.user!.username} 님",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 32,
              ),
              CustomTextFiled(
                controller: controller.secretTextController,
                hintText: "내용을 입력하세요",
                minLines: 7,
                maxLines: 8,
                focusNode: controller.secretTextFocus,
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                  onPressed: () => controller.uploadSecret(), title: '비밀 작성하기')
            ],
          )),
    );
  }
}
