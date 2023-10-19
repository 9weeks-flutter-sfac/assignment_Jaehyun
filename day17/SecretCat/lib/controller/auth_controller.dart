import 'package:assignment2/view/pages/Login_page.dart';
import 'package:assignment2/view/pages/main_page.dart';
import 'package:assignment2/widgets/custom_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../model/users.dart';

// id :  testjaehyun180@naver.com
// pw :  testjaehyun

class AuthController extends GetxController {
  Rxn<User> _user = Rxn();
  Dio dio = Dio();
  User? get user => _user.value;

  // 유저핸들링
  _handleAuth(User? data) {
    data != null ? Get.toNamed(MainPage.route) : Get.toNamed(LoginPage.route);
  }

  login(String id, String pw) async {
    // 비어있는값 유효성 검사
    if (id.isEmpty || pw.isEmpty) {
      Get.dialog(CustomDialog(title: "로그인 실패", content: "아이디 와 비밀번호를 입력해주세요"));
      return;
    } else {
      // 로그인 로직 처리
      try {
        String url =
            "http://52.79.115.43:8090/api/collections/users/auth-with-password";
        var res = await dio.post(url, data: {
          "identity": id,
          "password": pw,
        });
        if (res.statusCode == 200) {
          var user = User.fromMap(res.data['record']);
          _user(user);
          print("로그인성공");
          Get.snackbar("반갑습니다", "${user.username} 님 ",
              titleText: Text(
                "반갑습니다",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              messageText: Text(
                "${user.username} 님 ",
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.white70, // 배경색을 지정합니다.
              margin: EdgeInsets.all(8),
              duration: Duration(milliseconds: 1300));
          return;
        }
      } catch (e) {
        print("id : ${id} pw : ${pw} ");
        print("로그인 에러 ${e}");
        Get.dialog(CustomDialog(title: "로그인 실패", content: "아이디와 비밀번호를 확인해주세요"));
        return;
      }
    }
  }

  logout() {
    _user.value = null;
    print(_user.value);
    print("로그아웃 성공");
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuth);
  }
}
