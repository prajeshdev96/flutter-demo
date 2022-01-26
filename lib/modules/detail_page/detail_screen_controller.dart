import 'package:demo_1/modal/compectsapi.dart';
import 'package:demo_1/network/api_client.dart';
import 'package:get/get.dart';

class CompactApiFetchDataController extends GetxController {
  List<CompactsModal> compactDetailApiDetail = [];

  @override
  void onInit() {
    int id = Get.arguments;
    compactPostIdapiData(id);
    super.onInit();
  }

  compactPostIdapiData(int id) async {
    if (compactDetailApiDetail.isEmpty) {
      compactDetailApiDetail = await ApiClient.instance.getCompacts(id);
      update();
    }
  }
}