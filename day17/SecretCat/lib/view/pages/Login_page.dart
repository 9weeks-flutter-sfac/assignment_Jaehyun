// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignment2/controller/login_controller.dart';
import 'package:assignment2/view/pages/signup_page.dart';
import 'package:assignment2/widgets/custom_button.dart';
import '../../widgets/custom_textFiled.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Positioned.fill(
            child: Image.network(
                "https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2043&q=80",
                fit: BoxFit.cover)),
        Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(),
                  child: Text(
                    "비밀듣는 고양이",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                CustomTextFiled(
                  controller: controller.idController,
                  hintText: "아이디",
                ),
                CustomTextFiled(
                  controller: controller.pwController,
                  hintText: "비밀번호",
                  isPassword: true,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  onPressed: () => Get.toNamed(SignUpPage.route),
                  title: "회원가입",
                  tapColor: Color.fromARGB(99, 16, 96, 19),
                ),
                CustomButton(
                  onPressed: () => controller.login(),
                  title: "로그인",
                  tapColor: Color.fromARGB(74, 244, 67, 54),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
