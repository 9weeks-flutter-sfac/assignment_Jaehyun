import 'package:get/get.dart';
import 'dart:async';

class CoinController extends GetxController {
  RxInt coin = 0.obs;
  Timer? timer;

  void increase() {
    coin.value++;
    if (coin.value % 10 == 0) {
      Get.snackbar("축하합니다!", "현재 코인 수: ${coin.value}");
    }
  }

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => increase());
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
