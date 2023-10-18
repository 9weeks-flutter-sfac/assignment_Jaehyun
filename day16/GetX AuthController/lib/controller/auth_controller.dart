// ignore_for_file: deprecated_member_use

import 'package:assignment2/controller/main_controller.dart';
import 'package:assignment2/util/api_routes.dart';
import 'package:assignment2/view/pages/login_page.dart';
import 'package:assignment2/view/pages/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  Rxn<User> _user = Rxn();
  Dio dio = Dio();
  User? get user => _user.value;

  _handleAuthChanged(User? data) {
    if (data != null) {
      // 메인 페이지 이동
      Get.toNamed(MainPage.route);
      return;
    }
    // 로그인 페이지 이동
    Get.toNamed(LoginPage.route);
    return;
  }

  login(String id, String pw) async {
    try {
      dio.options.baseUrl = "http://52.79.115.43:8090";
      var res = await dio.post(ApiRoutes.authWithPassword, data: {
        'identity': id,
        'password': pw,
      });
      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _user(user);
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.requestOptions.path);
    }
  }

  logout() {
    _user.value = null;
    Get.find<MainController>().curPage.value = 0;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
