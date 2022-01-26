import 'package:demo_1/comman%20/get_stroge.dart';
import 'package:demo_1/local/db.dart';
import 'package:demo_1/modal/modal.dart';
import 'package:demo_1/modules/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditUserController extends GetxController {
  final editFormKey = GlobalKey<FormState>();
  TextEditingController firstNameEditController = TextEditingController();
  TextEditingController lastNameEditController = TextEditingController();
  TextEditingController emailEditController = TextEditingController();
  late User user;

  @override
  void onInit() {
    user = Get.arguments as User;
    textEditInit();
    super.onInit();
  }

  textEditInit() {
    var data = user;
    firstNameEditController.text = data.fristName!;
    lastNameEditController.text = data.lastName!;
    emailEditController.text = data.email!;
  }

  updateProfile() async {
    await Db().userDAO.updateForEdit(firstNameEditController.text, lastNameEditController.text, emailEditController.text, user.id!);
    update();
  }

  editButton() {
    updateProfile();
    AppPref().userLoginData = emailEditController.text;
    Get.offAll(HomePage());
    update();
  }
}
