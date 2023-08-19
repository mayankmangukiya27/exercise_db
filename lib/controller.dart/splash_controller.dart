import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startNavigation();
  }

  startNavigation() {
    Timer(
      Duration(seconds: 2),
      () {
        Get.offAndToNamed("/exercises");
      },
    );
  }
}
