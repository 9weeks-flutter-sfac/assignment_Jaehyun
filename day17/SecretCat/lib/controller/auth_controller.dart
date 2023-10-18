import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

import '../model/users.dart';

class AuthController extends GetxController {
  Rxn<User> _user = Rxn();
  Dio dio = Dio();

  // 유저핸들링
  _handleAuth(User? data) {
    // data != null ? Get.toNamed(page) return; : Get.toNamed(page) return;
  }

  login() async {
    try {
      String url =
          "http://52.79.115.43:8090/api/collections/users/records?sort=-created";
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        print(res.data);
        print(res.data.runtimeType);
      }
    } catch (e) {}
  }

  logout() {}

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuth);
  }
}


