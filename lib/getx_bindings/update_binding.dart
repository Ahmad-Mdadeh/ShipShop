import 'package:get/get.dart';
import 'package:shipshop/modules/products/update/update_controller.dart';

class UpDateBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UpDateController>(UpDateController());
  }
}