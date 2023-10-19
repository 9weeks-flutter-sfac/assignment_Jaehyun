// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment2/controller/auth_controller.dart';
import 'package:assignment2/view/pages/author_page.dart';
import 'package:assignment2/view/pages/secret_page.dart';
import 'package:assignment2/view/pages/upload_page.dart';
import 'package:assignment2/widgets/custom_button.dart';
import 'package:assignment2/widgets/reversCustom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<AuthController> {
  const MainPage({super.key});
  static const String route = '/main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://images.unsplash.com/photo-1596854372407-baba7fef6e51?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2080&q=80"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomButton(
                        onPressed: () => Get.toNamed(SecretPage.route),
                        title: "글 작성하러 가기",
                        sizeBoxHeight: 32,
                      ),
                      CustomButton(
                        onPressed: () => Get.toNamed(AuthorPage.route),
                        title: "작성한 사람 보러가기",
                        sizeBoxHeight: 32,
                      ),
                      CustomButton(
                        onPressed: () => Get.toNamed(UploadPage.route),
                        title: "글 작성 하기",
                      ),
                    ]),
              ),
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ReverseCustomButton(
                      onPressed: () => controller.logout(),
                      title: "로그아웃 하기",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
