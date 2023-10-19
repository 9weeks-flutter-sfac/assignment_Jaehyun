import 'dart:convert';

import 'package:assignment2/model/users.dart';
import 'package:assignment2/widgets/Custom_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/utils.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final usernameController = TextEditingController();

// 포커스
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final passwordConfirmFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  Future<void> signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    String passwordConfirm = passwordConfirmController.text;
    String username = usernameController.text;

    // 유효성 검사 함수
    bool isValidEmail(String email) => email.isNotEmpty && email.contains('@');
    bool isValidPassword(String pass) => pass.isNotEmpty && pass.length >= 9;
    bool isPasswordConfirmed(String pass1, String pass2) => pass1 == pass2;
    bool isValidUsername(String user) => user.isNotEmpty;

    if (!isValidEmail(email)) {
      showErrorDialog('이메일 형식에 맞지 않습니다.');
      emailFocusNode.requestFocus(); // 포커스 설정
      return;
    }

    if (!isValidPassword(password)) {
      showErrorDialog('비밀번호는 최소 9자 이상이어야 합니다.');
      passwordFocusNode.requestFocus(); // 포커스 설정
      return;
    }

    if (!isPasswordConfirmed(password, passwordConfirm)) {
      showErrorDialog('비밀번호가 일치하지 않습니다.');
      passwordConfirmFocusNode.requestFocus(); // 포커스 설정
      return;
    }

    if (!isValidUsername(username)) {
      showErrorDialog('닉네임은 비어있으면 안됩니다.');
      usernameFocusNode.requestFocus(); //포커스 설정
      return;
    }

    print('회원가입 가능');
    registerUser(email, password, passwordConfirm, username);
  }

  // 다이얼로그
  void showErrorDialog(String message) {
    Get.dialog(CustomDialog(title: "회원가입 실패", content: message));
  }

  // 사용자 등록
  Future<void> registerUser(String email, String password,
      String passwordConfirm, String username) async {
    try {
      Dio dio = Dio();
      var res = await dio.post(
          'http://52.79.115.43:8090/api/collections/users/records',
          options: Options(headers: {"Content-Type": "application/json"}),
          data: json.encode({
            "email": email,
            "password": password,
            "passwordConfirm": passwordConfirm,
            "username": username
          }));

      if (res.statusCode == 200) {
        // var user = User.fromMap(res.data);
        print('회원가입성공');
        Get.offAllNamed('/login');
        Get.snackbar("회원가입 성공", "로그인 해보세요",
            titleText: Text(
              "회원가입 성공",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            messageText: Text(
              "로그인 해보세요",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.white70, // 배경색을 지정합니다.
            margin: EdgeInsets.all(8),
            duration: Duration(milliseconds: 1300));
      } else {
        print('에러1: ${res.data['message']}');
      }
    } catch (e) {
      print('에러2: $e');
    }
  }
}
