import 'package:demo_1/comman%20/get_stroge.dart';
import 'package:demo_1/modules/home/home_screen.dart';
import 'package:demo_1/modules/intro/intro_screen.dart';
import 'package:demo_1/modules/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 1500), () => check());
  }

  Future checkLogin() async {
    if (AppPref().userLogin.isEmpty) {
      Get.off(LogInScreen());
    } else {
      Get.off(HomePage());
    }
  }

  Future check() async {
    if (AppPref().introScr.isEmpty) {
      Get.off(const IntroScrren());
    } else {
      checkLogin();
    }
  }
}
