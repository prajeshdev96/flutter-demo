import 'package:demo_1/comman%20/get_stroge.dart';
import 'package:demo_1/local/db.dart';
import 'package:demo_1/modal/modal.dart';
import 'package:demo_1/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SighupController extends GetxController {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  String _selectRadio = "";

  adduser() async {
    var _user = User(
        fristName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: conformPasswordController.text,
        gender: selectRadio);
    await Db().userDAO.insertUser(_user);
  }

  singUpButton() {
    if (formKey.currentState!.validate()) {
      adduser();
      AppPref().userLoginData = emailController.text;
      Get.off(HomePage());
    }
  }

  String get selectRadio => _selectRadio;

  radioButtonValue(value) {
    _selectRadio = value;
    update();
  }
}
