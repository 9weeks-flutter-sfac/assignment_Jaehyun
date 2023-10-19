import 'package:assignment2/controller/secret_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UploadController extends GetxController {
  final secretTextController = TextEditingController();

  final secretTextFocus = FocusNode();

  uploadSecret() {
    Get.find<SecretController>().uploadSecret(secretTextController.text);
  }
}
