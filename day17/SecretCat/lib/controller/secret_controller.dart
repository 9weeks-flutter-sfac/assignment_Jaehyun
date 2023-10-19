import 'dart:convert';

import 'package:assignment2/controller/auth_controller.dart';
import 'package:assignment2/controller/upload_controller.dart';
import 'package:assignment2/model/secrets.dart';
import 'package:assignment2/view/pages/main_page.dart';
import 'package:assignment2/widgets/Custom_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SecretController extends GetxController {
  final authController = Get.find<AuthController>();
  final uploadController = Get.find<UploadController>();

  Dio dio = Dio();
  var secrets = RxList<Secret>();
  var author = [];

  readSecret() async {
    try {
      String url =
          "http://52.79.115.43:8090/api/collections/secrets/records?sort=-created";
      var res = await dio.get(url);
      if (res.statusCode == 200) {
        print(res.data);
        var dataList = (res.data["items"] as List)
            .map((item) => Secret.fromMap(item))
            .toList();

        secrets.addAll(dataList);
        print("데이터 불러오기 성공");
        readAuthor(dataList);
      }
    } catch (e) {
      print("데이터 불러오기 에러발생 ${e}");
    }
  }

  readAuthor(dataList) {
    author = dataList.map((e) => e.authorName).toSet().toList();
    print(author);
  }

  uploadSecret(text) async {
    if (text == null || text.isEmpty) {
      Get.dialog(CustomDialog(title: "글작성 실패", content: "내용을 넣어주세요"));
      uploadController.secretTextFocus.requestFocus();
      return;
    }
    try {
      var url = "http://52.79.115.43:8090/api/collections/secrets/records";
      var res = await dio.post(url,
          options: Options(headers: {"Content-Type": "application/json"}),
          data: json.encode({
            "secret": text,
            "author": authController.user?.id,
            // - 해당 author는 User Record ID를 입력할 것
            "authorName": authController.user?.username,
          }));

      if (res.statusCode == 200) {
        print(res.data);
        print("글작성완료");
        Get.back();
        Get.snackbar(
          "${authController.user!.username} 님의 비밀 글 작성완료",
          text,
          titleText: Text(
            "${authController.user!.username} 님의 비밀 글 작성완료",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            text,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white70, // 배경색을 지정합니다.
          margin: EdgeInsets.all(8),
        );
        return;
      }
    } catch (e) {
      print("글 작성 서버 에러 ${e}");
      return;
    }
  }

  @override
  void onInit() {
    super.onInit();
    readSecret();
  }
}
