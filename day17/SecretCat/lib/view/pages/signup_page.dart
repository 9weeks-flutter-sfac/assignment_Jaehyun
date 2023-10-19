// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables
import 'package:assignment2/controller/auth_controller.dart';
import 'package:assignment2/controller/signup_controller.dart';
import 'package:assignment2/widgets/custon_textFiled.dart';
import 'package:assignment2/widgets/cutom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class SignUpPage extends GetView<SignupController> {
  const SignUpPage({Key? key}) : super(key: key);
  static const String route = '/signup';

  @override
  Widget build(BuildContext context) {
// 텍스트 필드 스타일
    final inputDecoration = InputDecoration(
      fillColor: Colors.white54,
      filled: true,
      border: OutlineInputBorder(),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
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
                    "회원가입 ",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),

                // 회원가입 폼
                CustomTextFiled(
                  controller: controller.emailController,
                  focusNode: controller.emailFocusNode,
                  hintText: "이메일",
                ),
                CustomTextFiled(
                  controller: controller.passwordController,
                  focusNode: controller.passwordFocusNode,
                  hintText: "비밀번호",
                  isPassword: true,
                ),
                CustomTextFiled(
                  controller: controller.passwordConfirmController,
                  focusNode: controller.passwordConfirmFocusNode,
                  hintText: "비밀번호 확인",
                  isPassword: true,
                ),
                CustomTextFiled(
                  controller: controller.usernameController,
                  focusNode: controller.usernameFocusNode,
                  hintText: "닉네임",
                ),

                // 회원가입 버튼
                CustomButton(
                  onPressed: () => controller.signUp(),
                  title: "회원가입",
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
