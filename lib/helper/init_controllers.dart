import 'package:get/get.dart';
import 'package:getx_app_learning/controllers/list_controller.dart';
import 'package:getx_app_learning/controllers/tab_controller.dart';

Future<void> init() async {
  Get.put(TabControllerGet());
  Get.put(ListController());
}
