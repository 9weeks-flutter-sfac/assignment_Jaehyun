import 'package:assignment2/controller/auth_controller.dart';
import 'package:assignment2/controller/login_controller.dart';
import 'package:assignment2/controller/secret_controller.dart';
import 'package:assignment2/controller/signup_controller.dart';
import 'package:assignment2/controller/upload_controller.dart';
import 'package:assignment2/util/pages.dart';
import 'package:assignment2/view/pages/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: BindingsBuilder(
          () {
            Get.put(AuthController());
            Get.put(LoginController());
            Get.lazyPut(() => SignupController(), fenix: true);
            Get.lazyPut(() => SecretController(), fenix: true);
            Get.lazyPut(() => UploadController(), fenix: true);
          },
        ),
        initialRoute: LoginPage.route,
        getPages: AppPages.pages);
  }
}
