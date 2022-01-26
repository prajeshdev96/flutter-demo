import 'package:demo_1/local/db.dart';
import 'package:demo_1/modal/modal.dart';
import 'package:get/get.dart';

class AllDataController extends GetxController {
  late List<User> allUser;

  @override
  void onInit() {
    allUsers();
    super.onInit();
  }

  allUsers() async {
    var data = await Db().userDAO.getAllUser();
    allUser = data;
    print(data);
    update();
  }
}
