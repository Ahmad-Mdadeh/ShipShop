import 'package:get/get.dart';
import 'package:shipshop/modules/setting/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(SettingController());
  }
}