import 'dart:async';

import 'package:get/get.dart';
import 'package:open_weather_test/pages/login/login.dart';

class SplashController extends GetxController {
  SplashController() {
    Timer(Duration(milliseconds: 1500), () {
      Get.to(() => LoginPage());
    });
  }
}
