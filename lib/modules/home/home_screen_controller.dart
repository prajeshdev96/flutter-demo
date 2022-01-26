import 'dart:async';
import 'package:demo_1/comman%20/get_stroge.dart';
import 'package:demo_1/local/db.dart';
import 'package:demo_1/modal/modal.dart';
import 'package:demo_1/modal/todos_api.dart';
import 'package:demo_1/network/api_client.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final List<StreamSubscription> _stream = [];
  List<TodoModal> todosApiData = [];
  User? editUser;

  @override
  void onInit() {
    _stream.add(Db().userDAO.emailData(AppPref().userLogin).listen((value) {
      editUser = value!;
      update();
    }));
    todosApiAllData();
    super.onInit();
  }

  @override
  void onClose() {
    _stream.clear();
    super.onClose();
  }

  todosApiAllData() async {
    todosApiData = await ApiClient.instance.getTodos();
    update();
  }
}
