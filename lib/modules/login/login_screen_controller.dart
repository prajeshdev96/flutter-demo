import 'package:demo_1/comman%20/get_stroge.dart';
import 'package:demo_1/local/db.dart';
import 'package:demo_1/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LogInScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final globalFormKey = GlobalKey<FormState>();

  login() async {
    var data = await Db()
        .userDAO
        .loginData(emailController.text, passwordController.text);
    if (data.isNotEmpty) {
      AppPref().userLoginData = emailController.text;
      Get.offAll(HomePage());
      emailController.clear();
      passwordController.clear();
    } else {
      Fluttertoast.showToast(
          msg: "enter a valid email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
